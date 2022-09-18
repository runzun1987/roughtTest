String updateFcmDeviceTopic = /* GraphQL */ """
  mutation UpdateFcmDeviceTopic(
    \$input: UpdateFcmDeviceTopicInput!
    \$condition: ModelFcmDeviceTopicConditionInput
  ) {
    updateFcmDeviceTopic(input: \$input, condition: \$condition) {
      id
      fcmDeviceID
      fcmTopicID
      fcmDevices {
        id
        deviceId
        userPhone
        baseType
        fcmTopics {
          items {
            id
            fcmDeviceID
            fcmTopicID
            fcmDevices {
              id
              deviceId
              userPhone
              baseType
              fcmTopics {
                items {
                  id
                  fcmDeviceID
                  fcmTopicID
                  baseType
                  createdAt
                  updatedAt
                }
                nextToken
              }
              createdAt
              updatedAt
            }
            fcmTopics {
              id
              name
              baseType
              FcmDeviceID {
                items {
                  id
                  fcmDeviceID
                  fcmTopicID
                  baseType
                  createdAt
                  updatedAt
                }
                nextToken
              }
              createdAt
              updatedAt
            }
            baseType
            createdAt
            updatedAt
          }
          nextToken
        }
        createdAt
        updatedAt
      }
      fcmTopics {
        id
        name
        baseType
        FcmDeviceID {
          items {
            id
            fcmDeviceID
            fcmTopicID
            fcmDevices {
              id
              deviceId
              userPhone
              baseType
              fcmTopics {
                items {
                  id
                  fcmDeviceID
                  fcmTopicID
                  baseType
                  createdAt
                  updatedAt
                }
                nextToken
              }
              createdAt
              updatedAt
            }
            fcmTopics {
              id
              name
              baseType
              FcmDeviceID {
                items {
                  id
                  fcmDeviceID
                  fcmTopicID
                  baseType
                  createdAt
                  updatedAt
                }
                nextToken
              }
              createdAt
              updatedAt
            }
            baseType
            createdAt
            updatedAt
          }
          nextToken
        }
        createdAt
        updatedAt
      }
      baseType
      createdAt
      updatedAt
    }
  }
""";

String createFcmDeviceTopic = /* GraphQL */ """
  mutation CreateFcmDeviceTopic(
    \$input: CreateFcmDeviceTopicInput!
    \$condition: ModelFcmDeviceTopicConditionInput
  ) {
    createFcmDeviceTopic(input: \$input, condition: \$condition) {
      id
      fcmDeviceID
      fcmTopicID
      fcmDevices {
        id
        deviceId
        userPhone
        baseType
        fcmTopics {
          items {
            id
            fcmDeviceID
            fcmTopicID
            fcmDevices {
              id
              deviceId
              userPhone
              baseType
              fcmTopics {
                items {
                  id
                  fcmDeviceID
                  fcmTopicID
                  baseType
                  createdAt
                  updatedAt
                }
                nextToken
              }
              createdAt
              updatedAt
            }
            fcmTopics {
              id
              name
              baseType
              FcmDeviceID {
                items {
                  id
                  fcmDeviceID
                  fcmTopicID
                  baseType
                  createdAt
                  updatedAt
                }
                nextToken
              }
              createdAt
              updatedAt
            }
            baseType
            createdAt
            updatedAt
          }
          nextToken
        }
        createdAt
        updatedAt
      }
      fcmTopics {
        id
        name
        baseType
        FcmDeviceID {
          items {
            id
            fcmDeviceID
            fcmTopicID
            fcmDevices {
              id
              deviceId
              userPhone
              baseType
              fcmTopics {
                items {
                  id
                  fcmDeviceID
                  fcmTopicID
                  baseType
                  createdAt
                  updatedAt
                }
                nextToken
              }
              createdAt
              updatedAt
            }
            fcmTopics {
              id
              name
              baseType
              FcmDeviceID {
                items {
                  id
                  fcmDeviceID
                  fcmTopicID
                  baseType
                  createdAt
                  updatedAt
                }
                nextToken
              }
              createdAt
              updatedAt
            }
            baseType
            createdAt
            updatedAt
          }
          nextToken
        }
        createdAt
        updatedAt
      }
      baseType
      createdAt
      updatedAt
    }
  }
""";
