import json
import netrc
import os
import sys
import datetime
from urllib.error import HTTPError, URLError
from urllib.parse import urlparse, urljoin

from urllib.request import (build_opener, install_opener,
                            HTTPRedirectHandler as UrllibHTTPRedirectHandler, Request, urlopen)
from urllib3.filepost import encode_multipart_formdata
from w3lib.http import basic_auth_header

import requests
import boto3


def _upload_egg(target, eggpath, project, version):
    with open(eggpath, 'rb') as f:
        eggdata = f.read()
    data = {
        'project': project,
        'version': version,
        'egg': ('project.egg', eggdata),
    }

    body, content_type = encode_multipart_formdata(data)
    url = _url(target, 'addversion.json')
    headers = {
        'Content-Type': content_type,
        'Content-Length': str(len(body)),
    }
    req = Request(url, body, headers)
    _add_auth_header(req, target)
    _log('Deploying to project "%s" in %s' % (project, url))
    return _http_post(req)


def _url(target, action):
    return urljoin(target['url'], action)


def _add_auth_header(request, target):
    if 'username' in target:
        u, p = target.get('username'), target.get('password', '')
        request.add_header('Authorization', basic_auth_header(u, p))
    else:  # try netrc
        try:
            host = urlparse(target['url']).hostname
            a = netrc.netrc().authenticators(host)
            request.add_header('Authorization', basic_auth_header(a[0], a[2]))
        except (netrc.NetrcParseError, IOError, TypeError):
            pass


def _log(message):
    sys.stderr.write(message + os.linesep)


def _http_post(request):
    dynamodb = boto3.resource('dynamodb',
                              aws_access_key_id=os.environ['ACCESSKEYID'],
                              aws_secret_access_key=os.environ['SECRETACCESSKEY'],
                              region_name="ap-southeast-1"
                              )

    table = dynamodb.Table('ScrapDetail-ts4dvmqdpfgm7e3bos4c3awnti-kachuwa')

    try:
        f = urlopen(request)
        _log("Server response (%s):" % f.code)
        print(f.read().decode())
        print('Successful')
        url = "https://limitless-oasis-22717.herokuapp.com/schedule.json"
        params = {'project': 'shipNepal',
                  'spider': 'shipnepal'}

        x = requests.post(url, params=params)

        print(x)
        print('Succesfully send command to crawl')
        return True
    except HTTPError as e:
        _log("Deploy failed (%s):" % e.code)
        resp = e.read().decode()
        try:
            d = json.loads(resp)
        except ValueError:
            print(resp)
        else:
            if "status" in d and "message" in d:
                print("Status: %(status)s" % d)
                print("Message:\n%(message)s" % d)
            else:
                print(json.dumps(d, indent=3))
    except URLError as e:
        _log("Deploy failed: %s" % e)


def handler(event, context):
    target = {'url': 'https://limitless-oasis-22717.herokuapp.com/',
              'project': 'shipNepal'}
    eggPath = "./1.egg"
    project = "shipNepal"
    version = "2000000"
    print('received event:')
    print(event)
    _upload_egg(target, eggPath, project, version)
    # print(scr)
    # # print(etree)
    # # if __name__ == "__main__":
    # #     main()

    return {
        'statusCode': 200,
        'headers': {
            'Access-Control-Allow-Headers': '*',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'OPTIONS,POST,GET'
        },
        'body': json.dumps('Hello from your new Amplify Python lambda!')
    }
