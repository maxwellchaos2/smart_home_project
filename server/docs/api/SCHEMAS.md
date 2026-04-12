# Server API Schemas

Ниже перечислены request/response модели из `src/application/models` и inline-контракты, которые формируются прямо в handler’ах.

## 1. Projects

### CreateProjectRequestModel
- `name: String` (required)

### ProjectResponseModel
- `id: int` (required)
- `name: String` (required)
- `createdAt: DateTime` (required)
- `hasYandexAuth: bool` (required)

## 2. Users

### CreateUserRequestModel
- `name: String` (required)
- `type: String` (required)
- `username: String` (required)
- `password: String` (required)
- `email: String?` (required nullable)

### UserResponseModel
- `name: String` (required)
- `type: String` (required)
- `createdAt: DateTime` (required)
- `updatedAt: DateTime` (required)
- `username: String` (required)
- `email: String?` (required nullable)
- `projectsId: List<int>` (required)

## 3. Rooms / Floors

### RoomInputRequestModel
- `name: String` (required)
- `floorId: int` (required)

### RoomResponseModel
- `id: int` (required)
- `name: String` (required)
- `floorId: int` (required)
- `planMediaPath: String?` (required nullable)
- `createdAt: DateTime` (required)
- `updatedAt: DateTime` (required)

### CreateFloorRequestModel
- `name: String` (required)

### FloorResponseModel
- `id: int` (required)
- `name: String` (required)
- `projectId: int` (required)
- `createdAt: DateTime` (required)
- `updatedAt: DateTime` (required)
- `planMediaPath: String?` (required nullable)

## 4. Devices / Positions

### DeviceInputRequestModel
- `type: String` (required)
- `providerType: String` (required)
- `providerDeviceId: String?` (required nullable)
- `inputId: int?` (required nullable)
- `outputId: int?` (required nullable)
- `isHidden: bool?` (required nullable)
- `name: String` (required)
- `capabilities: List<Map<String, dynamic>>` (required)
- `properties: List<Map<String, dynamic>>` (required)
- `roomId: int?` (required nullable)
- `floorId: int?` (required nullable)
- `customData: Map<String, Object?>?` (required nullable)

### DeviceResponseModel
- `id: int` (required)
- `providerType: String` (required)
- `providerDeviceId: String?` (required nullable)
- `type: String` (required)
- `inputId: int?` (required nullable)
- `outputId: int?` (required nullable)
- `name: String` (required)
- `isHidden: bool` (required)
- `capabilities: List<Map<String, dynamic>>` (required)
- `properties: List<Map<String, dynamic>>` (required)
- `createdAt: DateTime` (required)
- `updatedAt: DateTime` (required)
- `roomId: int?` (required nullable)
- `floorId: int?` (required nullable)
- `projectId: int` (required)
- `customData: Map<String, Object?>?` (required nullable)
- `lastHeartbeat: DateTime` (required)
- `status: String` (required)

### DevicePositionInputRequestModel
- `x: double` (required)
- `y: double` (required)
- `angle: double` (required)
- `deviceId: int` (required)

### DevicePositionResponseModel
- `id: int` (required)
- `x: double` (required)
- `y: double` (required)
- `angle: double` (required)
- `iconMediaPath: String?` (required nullable)
- `disabledIconMediaPath: String?` (required nullable)
- `deviceId: int` (required)

## 5. Device Scenarios

### DeviceScenarioInputRequestModel
- `name: String` (required)
- `condition: ConditionRequestModel` (required)
- `actions: List<ActionRequestModel>` (required)

### DeviceScenarioResponseModel
- `id: int` (required)
- `name: String` (required)
- `condition: ConditionResponseModel` (required)
- `actions: List<ActionResponseModel>` (required)
- `createdAt: DateTime` (required)
- `updatedAt: DateTime` (required)

### ActionRequestModel (`unionKey: type`)
- `changeDeviceState`
  - `deviceId: int` (required)
  - `state: Map<String, dynamic>` (required)
- `delay`
  - `seconds: int` (required)

### ConditionRequestModel (`unionKey: type`)
- `logic`
  - `logic: String` (required)
  - `conditions: List<ConditionRequestModel>` (required)
- `deviceState`
  - `deviceId: int` (required)
  - `state: Map<String, dynamic>` (required)
- `deviceStateValue`
  - `deviceId: int` (required)
  - `state: Map<String, dynamic>` (required)
  - `operator: String` (required)
- `inputState`
  - `inputId: int` (required)
  - `state: bool?` (required nullable)
- `deviceEvent`
  - `deviceId: int` (required)
  - `event: Map<String, dynamic>` (required)

## 6. InOut Scenarios

### InOutScenarioInputRequestModel
- `name: String` (required)
- `condition: ConditionRequestModel` (required)
- `actions: List<ActionRequestModel>` (required)

### InOutScenarioResponseModel
- `id: int` (required)
- `name: String` (required)
- `condition: ConditionResponseModel` (required)
- `actions: List<ActionResponseModel>` (required)
- `createdAt: DateTime` (required)
- `updatedAt: DateTime` (required)

### ActionRequestModel (`unionKey: type`)
- `changeDevice`
  - `deviceId: String` (required)
  - `state: bool?` (required nullable)
- `delay`
  - `seconds: int` (required)

### ConditionRequestModel (`unionKey: type`)
- `logic`
  - `logic: String` (required)
  - `conditions: List<ConditionRequestModel>` (required)
- `state`
  - `deviceId: String` (required)
  - `state: bool?` (required nullable)

## 7. Yandex Dialogs

### DevicesStateInputRequestModel
- `devices: List<DeviceStateInputRequestModel>` (required)

### DeviceStateInputRequestModel
- `id: String` (required)
- `customData: Map<String, dynamic>?` (required nullable)

### ActionDeviceRequestModel
- `id: String` (required)
- `customData: Map<String, dynamic>?` (required nullable)
- `capabilities: List<Map<String, dynamic>>?` (required nullable)

### ActionResultResponseModel
- `status: String` (required)
- `errorCode: String?` (optional)

### ActionDeviceResultResponseModel
- `id: String` (required)
- `actionResult: ActionResultResponseModel` (required)

### YandexDeviceResponseModel
- `id: String` (required)
- `name: String` (required)
- `statusInfo: DeviceStatusInfoModel` (required)
- `description: String?` (required nullable)
- `room: String?` (required nullable)
- `type: String` (required)
- `customData: Map<String, dynamic>?` (required nullable)
- `capabilities: List<Map<String, dynamic>>?` (required nullable)
- `properties: List<Map<String, dynamic>>?` (required nullable)
- `deviceInfo: Map<String, dynamic>?` (required nullable)

### DeviceStatusInfoModel
- `reportable: bool` (required)

## 8. Inline contracts (без отдельного model-файла)

### Auth token
- `POST /api/tokens/login` body: `{ username, password }`
- `POST /api/tokens/refresh` body: `{ refreshToken }` или `refresh_token` form field
- `POST /api/tokens/revoke` body: `{ refreshToken }`
- `POST /api/tokens/login-device` body: `{ deviceId }`

### Email verification
- `POST /email_verification/send_code` body: `{ email }`
- `POST /email_verification/confirm_code` body: `{ email, code }`

### OAuth form contracts
- `POST /oauth/login/submit`: `username`, `password`, `state`, `scope`, `redirect_uri`, `client_id`
- `POST /oauth/token`: `code`, `client_id`, `client_secret`, `grant_type`

### Service responses with ad-hoc objects/strings
- delete endpoints: `{ message: String }`
- status endpoints: `{ status: String }` или plain `Success`/`Token revoked`