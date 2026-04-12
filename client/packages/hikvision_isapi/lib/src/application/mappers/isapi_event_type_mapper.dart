import 'package:hikvision_isapi/src/domain/domain.dart';

abstract final class IsapiEventTypeMapper {
  static String toName({required IsapiEventType from}) {
    return switch (from) {
      // Major 0x1 - Alarm events
      IsapiEventType.alarmIn => 'Тревога на входе',
      IsapiEventType.alarmOut => 'Тревога на выходе',
      IsapiEventType.motionDetectStart => 'Обнаружено движение',
      IsapiEventType.motionDetectStop => 'Движение прекращено',
      IsapiEventType.hideAlarmStart => 'Началась тревога скрытия',
      IsapiEventType.hideAlarmStop => 'Тревога скрытия прекращена',
      IsapiEventType.vcaAlarmStart => 'VCA тревога началась',
      IsapiEventType.vcaAlarmStop => 'VCA тревога прекращена',
      IsapiEventType.netAlarmStart => 'Сетевая тревога началась',
      IsapiEventType.netAlarmStop => 'Сетевая тревога прекращена',
      IsapiEventType.alarmInRevert => 'Тревога на входе восстановлена',
      IsapiEventType.alarmInShortCircuit => 'Короткое замыкание входа тревоги',
      IsapiEventType.alarmInBrokenCircuit => 'Обрыв цепи входа тревоги',
      IsapiEventType.alarmInException => 'Исключение входа тревоги',
      IsapiEventType.alarmInResume => 'Вход тревоги восстановлен',
      IsapiEventType.hostDesmantleAlarm => 'Тревога вскрытия хоста',
      IsapiEventType.hostDesmantleResume => 'Хост восстановлен',
      IsapiEventType.cardReaderDesmantleAlarm =>
        'Тревога вскрытия считывателя карт',
      IsapiEventType.cardReaderDesmantleResume =>
        'Считыватель карт восстановлен',
      IsapiEventType.caseSensorAlarm => 'Тревога датчика корпуса',
      IsapiEventType.caseSensorResume => 'Датчик корпуса восстановлен',
      IsapiEventType.stressAlarm => 'Тревога принуждения',
      IsapiEventType.offlineEventNearlyFull =>
        'Память офлайн событий почти заполнена',
      IsapiEventType.cardMaxAuthenticateFail =>
        'Превышен лимит неудачных попыток аутентификации',
      IsapiEventType.sdCardFull => 'SD карта заполнена',
      IsapiEventType.linkageCapturePic => 'Снимок по связке событий',
      IsapiEventType.securityModuleDesmantleAlarm =>
        'Тревога вскрытия модуля безопасности',
      IsapiEventType.securityModuleDesmantleResume =>
        'Модуль безопасности восстановлен',
      IsapiEventType.posStartAlarm => 'POS тревога началась',
      IsapiEventType.posEndAlarm => 'POS тревога закончилась',
      IsapiEventType.faceImageQualityLow => 'Низкое качество изображения лица',
      IsapiEventType.fingerPrintQualityLow =>
        'Низкое качество отпечатка пальца',
      IsapiEventType.fireImportShortCircuit =>
        'Короткое замыкание пожарного входа',
      IsapiEventType.fireImportBrokenCircuit => 'Обрыв цепи пожарного входа',
      IsapiEventType.fireImportResume => 'Пожарный вход восстановлен',
      IsapiEventType.fireButtonTrigger => 'Нажата кнопка пожарной тревоги',
      IsapiEventType.fireButtonResume =>
        'Кнопка пожарной тревоги восстановлена',
      IsapiEventType.maintenanceButtonTrigger => 'Нажата кнопка обслуживания',
      IsapiEventType.maintenanceButtonResume =>
        'Кнопка обслуживания восстановлена',
      IsapiEventType.emergencyButtonTrigger =>
        'Нажата кнопка экстренной помощи',
      IsapiEventType.emergencyButtonResume =>
        'Кнопка экстренной помощи восстановлена',
      IsapiEventType.distractControllerAlarm =>
        'Тревога распределенного контроллера',
      IsapiEventType.distractControllerResume =>
        'Распределенный контроллер восстановлен',
      IsapiEventType.channelControllerDesmantleAlarm =>
        'Тревога вскрытия контроллера канала',
      IsapiEventType.channelControllerDesmantleResume =>
        'Контроллер канала восстановлен',
      IsapiEventType.channelControllerFireImportAlarm =>
        'Тревога пожарного входа контроллера канала',
      IsapiEventType.channelControllerFireImportResume =>
        'Пожарный вход контроллера канала восстановлен',
      IsapiEventType.printerOutOfPaper => 'В принтере закончилась бумага',
      IsapiEventType.pswOpenDoorFailedOverlimit =>
        'Превышен лимит неудачных попыток открытия по паролю',
      IsapiEventType.legalEventNearlyFull => 'Память событий почти заполнена',
      IsapiEventType.transactionRecordNearlyFull =>
        'Память транзакций почти заполнена',
      IsapiEventType.distractControllerFireImportShortCircuit =>
        'КЗ пожарного входа распределенного контроллера',
      IsapiEventType.distractControllerFireImportResumeAlt =>
        'Пожарный вход распределенного контроллера восстановлен',

      // Major 0x2 - Exception events
      IsapiEventType.viLost => 'Потеря видеосигнала',
      IsapiEventType.illegalAccess => 'Незаконный доступ',
      IsapiEventType.hdFull => 'Жесткий диск заполнен',
      IsapiEventType.hdError => 'Ошибка жесткого диска',
      IsapiEventType.dcdLost => 'Потеря DCD',
      IsapiEventType.ipConflict => 'Конфликт IP адресов',
      IsapiEventType.netBroken => 'Сеть недоступна',
      IsapiEventType.recError => 'Ошибка записи',
      IsapiEventType.ipcNoLink => 'Нет связи с IP камерой',
      IsapiEventType.viException => 'Исключение видеосигнала',
      IsapiEventType.ipcIpConflict => 'Конфликт IP адресов камеры',
      IsapiEventType.fanAbnormal => 'Неисправность вентилятора',
      IsapiEventType.fanResume => 'Вентилятор восстановлен',
      IsapiEventType.subsystemAbnormalReboot =>
        'Аварийная перезагрузка подсистемы',
      IsapiEventType.matrixStartBuzzer => 'Запуск зуммера матрицы',
      IsapiEventType.netAbnormal => 'Сетевая неисправность',
      IsapiEventType.memAbnormal => 'Неисправность памяти',
      IsapiEventType.fileAbnormal => 'Неисправность файловой системы',
      IsapiEventType.rs485DeviceAbnormal => 'Неисправность устройства RS485',
      IsapiEventType.rs485DeviceRevert => 'Устройство RS485 восстановлено',
      IsapiEventType.devPowerOn => 'Устройство включено',
      IsapiEventType.devPowerOff => 'Устройство выключено',
      IsapiEventType.watchDogReset => 'Сброс по watchdog',
      IsapiEventType.lowBattery => 'Низкий заряд батареи',
      IsapiEventType.batteryResume => 'Заряд батареи восстановлен',
      IsapiEventType.acOff => 'Питание AC отключено',
      IsapiEventType.acResume => 'Питание AC восстановлено',
      IsapiEventType.netResume => 'Сеть восстановлена',
      IsapiEventType.flashAbnormal => 'Неисправность флеш-памяти',
      IsapiEventType.cardReaderOffline => 'Считыватель карт не в сети',
      IsapiEventType.cardReaderResume => 'Считыватель карт восстановлен',
      IsapiEventType.indicatorLightOff => 'Индикатор выключен',
      IsapiEventType.indicatorLightResume => 'Индикатор восстановлен',
      IsapiEventType.channelControllerOff => 'Контроллер канала выключен',
      IsapiEventType.channelControllerResume =>
        'Контроллер канала восстановлен',
      IsapiEventType.securityModuleOff => 'Модуль безопасности выключен',
      IsapiEventType.securityModuleResume => 'Модуль безопасности восстановлен',
      IsapiEventType.batteryElectricLow => 'Низкий уровень заряда батареи',
      IsapiEventType.batteryElectricResume =>
        'Уровень заряда батареи восстановлен',
      IsapiEventType.localControlNetBroken =>
        'Локальная сеть управления недоступна',
      IsapiEventType.localControlNetResume =>
        'Локальная сеть управления восстановлена',
      IsapiEventType.masterRs485LoopnodeBroken => 'Обрыв главного узла RS485',
      IsapiEventType.masterRs485LoopnodeResume =>
        'Главный узел RS485 восстановлен',
      IsapiEventType.localControlOffline => 'Локальное управление не в сети',
      IsapiEventType.localControlResume => 'Локальное управление восстановлено',
      IsapiEventType.localDownsideRs485LoopnodeBroken =>
        'Обрыв нижнего узла RS485',
      IsapiEventType.localDownsideRs485LoopnodeResume =>
        'Нижний узел RS485 восстановлен',
      IsapiEventType.distractControllerOnline =>
        'Распределенный контроллер в сети',
      IsapiEventType.distractControllerOffline =>
        'Распределенный контроллер не в сети',
      IsapiEventType.idCardReaderNotConnect =>
        'Считыватель ID карт не подключен',
      IsapiEventType.idCardReaderResume => 'Считыватель ID карт восстановлен',
      IsapiEventType.fingerPrintModuleNotConnect =>
        'Модуль отпечатков не подключен',
      IsapiEventType.fingerPrintModuleResume =>
        'Модуль отпечатков восстановлен',
      IsapiEventType.cameraNotConnect => 'Камера не подключена',
      IsapiEventType.cameraResume => 'Камера восстановлена',
      IsapiEventType.comNotConnect => 'COM порт не подключен',
      IsapiEventType.comResume => 'COM порт восстановлен',
      IsapiEventType.deviceNotAuthorize => 'Устройство не авторизовано',
      IsapiEventType.peopleAndIdCardDeviceOnline =>
        'Устройство распознавания лиц и ID в сети',
      IsapiEventType.peopleAndIdCardDeviceOffline =>
        'Устройство распознавания лиц и ID не в сети',
      IsapiEventType.localLoginLock => 'Локальный вход заблокирован',
      IsapiEventType.localLoginUnlock => 'Локальный вход разблокирован',
      IsapiEventType.submarinebackCommBreak => 'Обрыв обратной связи',
      IsapiEventType.submarinebackCommResume => 'Обратная связь восстановлена',
      IsapiEventType.motorSensorException => 'Исключение датчика двигателя',
      IsapiEventType.canBusException => 'Исключение шины CAN',
      IsapiEventType.canBusResume => 'Шина CAN восстановлена',
      IsapiEventType.gateTemperatureOverrun => 'Превышена температура ворот',
      IsapiEventType.irEmitterException => 'Исключение ИК излучателя',
      IsapiEventType.irEmitterResume => 'ИК излучатель восстановлен',
      IsapiEventType.lampBoardCommException =>
        'Исключение связи с платой освещения',
      IsapiEventType.lampBoardCommResume =>
        'Связь с платой освещения восстановлена',
      IsapiEventType.irAdaptorCommException =>
        'Исключение связи с ИК адаптером',
      IsapiEventType.irAdaptorCommResume =>
        'Связь с ИК адаптером восстановлена',
      IsapiEventType.printerOnline => 'Принтер в сети',
      IsapiEventType.printerOffline => 'Принтер не в сети',
      IsapiEventType.fourGModuleOnline => '4G модуль в сети',
      IsapiEventType.fourGModuleOffline => '4G модуль не в сети',
      IsapiEventType.dspStartFailed => 'Не удалось запустить DSP',
      IsapiEventType.smartRegulationNotAllowed =>
        'Умное регулирование не разрешено',
      IsapiEventType.auxiliaryBoardOffline => 'Вспомогательная плата не в сети',
      IsapiEventType.auxiliaryBoardResume =>
        'Вспомогательная плата восстановлена',
      IsapiEventType.idcardSecurityModuleException =>
        'Исключение модуля безопасности ID карт',
      IsapiEventType.idcardSecurityModuleResume =>
        'Модуль безопасности ID карт восстановлен',
      IsapiEventType.fpPeripheralException => 'Исключение периферии отпечатков',
      IsapiEventType.fpPeripheralResume => 'Периферия отпечатков восстановлена',
      IsapiEventType.smartPlateOffline => 'Умная панель не в сети',
      IsapiEventType.smartPlateOnline => 'Умная панель в сети',
      IsapiEventType.refundLocked => 'Возврат заблокирован',
      IsapiEventType.coderOnline => 'Кодер в сети',
      IsapiEventType.coderOffline => 'Кодер не в сети',
      IsapiEventType.keyboardOffline => 'Клавиатура не в сети',
      IsapiEventType.keyboardOnline => 'Клавиатура в сети',
      IsapiEventType.fiveGModuleOnline => '5G модуль в сети',
      IsapiEventType.fiveGModuleOffline => '5G модуль не в сети',
      IsapiEventType.extendModuleOnline => 'Модуль расширения в сети',
      IsapiEventType.extendModuleOffline => 'Модуль расширения не в сети',
      IsapiEventType.interlockServerDisconnected =>
        'Сервер блокировки отключен',
      IsapiEventType.interlockServerConnected => 'Сервер блокировки подключен',
      IsapiEventType.qrcodeReaderOffline => 'Считыватель QR кодов не в сети',
      IsapiEventType.qrcodeReaderOnline => 'Считыватель QR кодов в сети',
      IsapiEventType.optionalBoardOffline => 'Опциональная плата не в сети',
      IsapiEventType.optionalBoardResume => 'Опциональная плата восстановлена',
      IsapiEventType.usbOnline => 'USB в сети',
      IsapiEventType.usbOffline => 'USB не в сети',
      IsapiEventType.localControlBackupException =>
        'Исключение резервной копии локального управления',
      IsapiEventType.socialSecurityCardReaderOnline =>
        'Считыватель соцкарт в сети',
      IsapiEventType.socialSecurityCardReaderOffline =>
        'Считыватель соцкарт не в сети',
      IsapiEventType.channelInfraredDetectorException =>
        'Исключение ИК детектора канала',
      IsapiEventType.channelInfraredDetectorWorkingException =>
        'Исключение работы ИК детектора канала',
      IsapiEventType.channelInfraredDetectorDetectException =>
        'Исключение обнаружения ИК детектора канала',
      IsapiEventType.channelInfraredDetectorNoTargetCalibrateException =>
        'Исключение калибровки ИК детектора без цели',
      IsapiEventType
            .channelInfraredDetectorTargetDistanceErrorCalibrateException =>
        'Ошибка дистанции при калибровке ИК детектора',
      IsapiEventType.channelInfraredNoChannelWidth =>
        'Нет ширины канала ИК детектора',

      // Major 0x3 - Operation events
      IsapiEventType.startDvr => 'DVR запущен',
      IsapiEventType.stopDvr => 'DVR остановлен',
      IsapiEventType.stopAbnormal => 'Аварийная остановка',
      IsapiEventType.rebootDvr => 'DVR перезагружен',
      IsapiEventType.localLogin => 'Локальный вход',
      IsapiEventType.localLogout => 'Локальный выход',
      IsapiEventType.localModifyTime => 'Изменение времени локально',
      IsapiEventType.localUpgrade => 'Локальное обновление',
      IsapiEventType.localCfgfileOutput => 'Экспорт конфигурации локально',
      IsapiEventType.localCfgfileInput => 'Импорт конфигурации локально',
      IsapiEventType.localModifyPassword => 'Изменение пароля локально',
      IsapiEventType.remoteLogin => 'Удаленный вход',
      IsapiEventType.remoteLogout => 'Удаленный выход',
      IsapiEventType.remoteGetParam => 'Получение параметров удаленно',
      IsapiEventType.remoteCfgParam => 'Настройка параметров удаленно',
      IsapiEventType.remoteGetStatus => 'Получение статуса удаленно',
      IsapiEventType.remoteArm => 'Постановка на охрану удаленно',
      IsapiEventType.remoteDisarm => 'Снятие с охраны удаленно',
      IsapiEventType.remoteReboot => 'Удаленная перезагрузка',
      IsapiEventType.remoteUpgrade => 'Удаленное обновление',
      IsapiEventType.remoteCfgfileOutput => 'Экспорт конфигурации удаленно',
      IsapiEventType.remoteCfgfileInput => 'Импорт конфигурации удаленно',
      IsapiEventType.remoteAlarmoutOpenMan =>
        'Открытие выхода тревоги удаленно',
      IsapiEventType.remoteAlarmoutCloseMan =>
        'Закрытие выхода тревоги удаленно',
      IsapiEventType.remoteLoginLock => 'Удаленный вход заблокирован',
      IsapiEventType.remoteLoginUnlock => 'Удаленный вход разблокирован',
      IsapiEventType.remoteOpenDoor => 'Дверь открыта удаленно',
      IsapiEventType.remoteCloseDoor => 'Дверь закрыта удаленно',
      IsapiEventType.remoteAlwaysOpen => 'Режим "всегда открыто" удаленно',
      IsapiEventType.remoteAlwaysClose => 'Режим "всегда закрыто" удаленно',
      IsapiEventType.remoteCheckTime => 'Проверка времени удаленно',
      IsapiEventType.ntpCheckTime => 'Синхронизация времени по NTP',
      IsapiEventType.remoteClearCard => 'Очистка карт удаленно',
      IsapiEventType.remoteRestoreCfg => 'Восстановление настроек удаленно',
      IsapiEventType.alarminArm => 'Вход тревоги поставлен на охрану',
      IsapiEventType.alarminDisarm => 'Вход тревоги снят с охраны',
      IsapiEventType.localRestoreCfg => 'Восстановление настроек локально',
      IsapiEventType.remoteCapturePic => 'Снимок по команде удаленно',
      IsapiEventType.modNetReportCfg => 'Изменение настроек сетевого отчета',
      IsapiEventType.modGprsReportParam => 'Изменение параметров GPRS отчета',
      IsapiEventType.modReportGroupParam =>
        'Изменение параметров группы отчетов',
      IsapiEventType.unlockPasswordOpenDoor =>
        'Открытие двери по паролю разблокировки',
      IsapiEventType.autoRenumber => 'Автоматическая перенумерация',
      IsapiEventType.autoComplementNumber =>
        'Автоматическое дополнение номеров',
      IsapiEventType.normalCfgfileInput => 'Импорт обычной конфигурации',
      IsapiEventType.normalCfgfileOutput => 'Экспорт обычной конфигурации',
      IsapiEventType.cardRightInput => 'Импорт прав карт',
      IsapiEventType.cardRightOutput => 'Экспорт прав карт',
      IsapiEventType.localUsbUpgrade => 'Обновление через USB',
      IsapiEventType.remoteVisitorCallLadder =>
        'Вызов лифта посетителем удаленно',
      IsapiEventType.remoteHouseholdCallLadder =>
        'Вызов лифта жильцом удаленно',
      IsapiEventType.remoteActualGuard =>
        'Фактическая постановка на охрану удаленно',
      IsapiEventType.remoteActualUnguard =>
        'Фактическое снятие с охраны удаленно',
      IsapiEventType.remoteControlNotCodeOperFailed =>
        'Операция удаленного управления без кода не удалась',
      IsapiEventType.remoteControlCloseDoor =>
        'Закрытие двери удаленным управлением',
      IsapiEventType.remoteControlOpenDoor =>
        'Открытие двери удаленным управлением',
      IsapiEventType.remoteControlAlwaysOpenDoor =>
        'Режим "всегда открыто" удаленным управлением',
      IsapiEventType.m1CardEncryptVerifyOpen =>
        'Открытие проверки шифрования M1 карты',
      IsapiEventType.m1CardEncryptVerifyClose =>
        'Закрытие проверки шифрования M1 карты',
      IsapiEventType.nfcFunctionOpen => 'Функция NFC включена',
      IsapiEventType.nfcFunctionClose => 'Функция NFC выключена',
      IsapiEventType.offlineDataOutput => 'Экспорт офлайн данных',
      IsapiEventType.localLoginUnlockOp =>
        'Операция разблокировки локального входа',
      IsapiEventType.createSshLink => 'Создание SSH соединения',
      IsapiEventType.closeSshLink => 'Закрытие SSH соединения',
      IsapiEventType.localImportUserinfo => 'Локальный импорт пользователей',
      IsapiEventType.localExportUserinfo => 'Локальный экспорт пользователей',
      IsapiEventType.createCertificate => 'Создание сертификата',
      IsapiEventType.uploadCertificate => 'Загрузка сертификата',
      IsapiEventType.deleteCertificate => 'Удаление сертификата',
      IsapiEventType.comsumeArm => 'Постановка потребления на охрану',
      IsapiEventType.comsumeDisarm => 'Снятие потребления с охраны',
      IsapiEventType.orcodeKeyModify => 'Изменение ключа OR-кода',
      IsapiEventType.distractControllerReboot =>
        'Перезагрузка распределенного контроллера',
      IsapiEventType.distractControllerResumeCfg =>
        'Восстановление конфигурации распределенного контроллера',
      IsapiEventType.alarmhostLocalSetDeviceActive =>
        'Локальная активация устройства хоста тревоги',
      IsapiEventType.alarmhostRemoteSetDeviceActive =>
        'Удаленная активация устройства хоста тревоги',
      IsapiEventType.localResetLoginPassword => 'Локальный сброс пароля входа',
      IsapiEventType.remoteModifyPassword => 'Удаленное изменение пароля',

      // Major 0x5 - Access control events
      IsapiEventType.legalCardPass => 'Проход по карте разрешен',
      IsapiEventType.cardAndPswPass => 'Проход по карте и паролю разрешен',
      IsapiEventType.cardAndPswFail => 'Проход по карте и паролю не удался',
      IsapiEventType.cardAndPswTimeout => 'Тайм-аут карты и пароля',
      IsapiEventType.cardAndPswOverTime => 'Превышено время карты и пароля',
      IsapiEventType.cardNoRight => 'У карты нет прав',
      IsapiEventType.cardInvalidPeriod => 'Карта вне периода действия',
      IsapiEventType.cardOutOfDate => 'Срок действия карты истек',
      IsapiEventType.invalidCard => 'Недействительная карта',
      IsapiEventType.antiSneakFail => 'Ошибка анти-проноса',
      IsapiEventType.interlockDoorNotClose => 'Блокирующая дверь не закрыта',
      IsapiEventType.notBelongMultiGroup => 'Не принадлежит к мульти-группе',
      IsapiEventType.invalidMultiVerifyPeriod =>
        'Недействительный период мульти-проверки',
      IsapiEventType.multiVerifySuperRightFail =>
        'Ошибка супер-права мульти-проверки',
      IsapiEventType.multiVerifyRemoteRightFail =>
        'Ошибка удаленного права мульти-проверки',
      IsapiEventType.multiVerifySuccess => 'Мульти-проверка успешна',
      IsapiEventType.leaderCardOpenBegin => 'Начало открытия ведущей картой',
      IsapiEventType.leaderCardOpenEnd => 'Конец открытия ведущей картой',
      IsapiEventType.alwaysOpenBegin => 'Начало режима "всегда открыто"',
      IsapiEventType.alwaysOpenEnd => 'Конец режима "всегда открыто"',
      IsapiEventType.lockOpen => 'Замок открыт',
      IsapiEventType.lockClose => 'Замок закрыт',
      IsapiEventType.doorButtonPress => 'Кнопка двери нажата',
      IsapiEventType.doorButtonRelease => 'Кнопка двери отпущена',
      IsapiEventType.doorOpenNormal => 'Дверь открыта нормально',
      IsapiEventType.doorCloseNormal => 'Дверь закрыта нормально',
      IsapiEventType.doorOpenAbnormal => 'Дверь открыта аномально',
      IsapiEventType.doorOpenTimeout => 'Превышено время открытия двери',
      IsapiEventType.alarmoutOn => 'Выход тревоги включен',
      IsapiEventType.alarmoutOff => 'Выход тревоги выключен',
      IsapiEventType.alwaysCloseBegin => 'Начало режима "всегда закрыто"',
      IsapiEventType.alwaysCloseEnd => 'Конец режима "всегда закрыто"',
      IsapiEventType.multiVerifyNeedRemoteOpen =>
        'Мульти-проверка требует удаленного открытия',
      IsapiEventType.multiVerifySuperpasswdVerifySuccess =>
        'Проверка супер-пароля мульти-проверки успешна',
      IsapiEventType.multiVerifyRepeatVerify => 'Повторная мульти-проверка',
      IsapiEventType.multiVerifyTimeout => 'Тайм-аут мульти-проверки',
      IsapiEventType.doorbellRinging => 'Звонок в дверь',
      IsapiEventType.fingerprintComparePass => 'Проверка отпечатка успешна',
      IsapiEventType.fingerprintCompareFail => 'Проверка отпечатка не удалась',
      IsapiEventType.cardFingerprintVerifyPass =>
        'Проверка карты и отпечатка успешна',
      IsapiEventType.cardFingerprintVerifyFail =>
        'Проверка карты и отпечатка не удалась',
      IsapiEventType.cardFingerprintVerifyTimeout =>
        'Тайм-аут проверки карты и отпечатка',
      IsapiEventType.cardFingerprintPasswdVerifyPass =>
        'Проверка карты, отпечатка и пароля успешна',
      IsapiEventType.cardFingerprintPasswdVerifyFail =>
        'Проверка карты, отпечатка и пароля не удалась',
      IsapiEventType.cardFingerprintPasswdVerifyTimeout =>
        'Тайм-аут проверки карты, отпечатка и пароля',
      IsapiEventType.fingerprintPasswdVerifyPass =>
        'Проверка отпечатка и пароля успешна',
      IsapiEventType.fingerprintPasswdVerifyFail =>
        'Проверка отпечатка и пароля не удалась',
      IsapiEventType.fingerprintPasswdVerifyTimeout =>
        'Тайм-аут проверки отпечатка и пароля',
      IsapiEventType.fingerprintInexistence => 'Отпечаток не существует',
      IsapiEventType.cardPlatformVerify => 'Проверка карты платформой',
      IsapiEventType.callCenter => 'Вызов центра',
      IsapiEventType.fireRelayTurnOnDoorAlwaysOpen =>
        'Пожарное реле включено - дверь всегда открыта',
      IsapiEventType.fireRelayRecoverDoorRecoverNormal =>
        'Пожарное реле восстановлено - дверь в норме',
      IsapiEventType.faceAndFpVerifyPass => 'Проверка лица и отпечатка успешна',
      IsapiEventType.faceAndFpVerifyFail =>
        'Проверка лица и отпечатка не удалась',
      IsapiEventType.faceAndFpVerifyTimeout =>
        'Тайм-аут проверки лица и отпечатка',
      IsapiEventType.faceAndPwVerifyPass => 'Проверка лица и пароля успешна',
      IsapiEventType.faceAndPwVerifyFail => 'Проверка лица и пароля не удалась',
      IsapiEventType.faceAndPwVerifyTimeout =>
        'Тайм-аут проверки лица и пароля',
      IsapiEventType.faceAndCardVerifyPass => 'Проверка лица и карты успешна',
      IsapiEventType.faceAndCardVerifyFail =>
        'Проверка лица и карты не удалась',
      IsapiEventType.faceAndCardVerifyTimeout =>
        'Тайм-аут проверки лица и карты',
      IsapiEventType.faceAndPwAndFpVerifyPass =>
        'Проверка лица, пароля и отпечатка успешна',
      IsapiEventType.faceAndPwAndFpVerifyFail =>
        'Проверка лица, пароля и отпечатка не удалась',
      IsapiEventType.faceAndPwAndFpVerifyTimeout =>
        'Тайм-аут проверки лица, пароля и отпечатка',
      IsapiEventType.faceCardAndFpVerifyPass =>
        'Проверка лица, карты и отпечатка успешна',
      IsapiEventType.faceCardAndFpVerifyFail =>
        'Проверка лица, карты и отпечатка не удалась',
      IsapiEventType.faceCardAndFpVerifyTimeout =>
        'Тайм-аут проверки лица, карты и отпечатка',
      IsapiEventType.employeenoAndFpVerifyPass =>
        'Проверка номера сотрудника и отпечатка успешна',
      IsapiEventType.employeenoAndFpVerifyFail =>
        'Проверка номера сотрудника и отпечатка не удалась',
      IsapiEventType.employeenoAndFpVerifyTimeout =>
        'Тайм-аут проверки номера сотрудника и отпечатка',
      IsapiEventType.employeenoAndFpAndPwVerifyPass =>
        'Проверка номера сотрудника, отпечатка и пароля успешна',
      IsapiEventType.employeenoAndFpAndPwVerifyFail =>
        'Проверка номера сотрудника, отпечатка и пароля не удалась',
      IsapiEventType.employeenoAndFpAndPwVerifyTimeout =>
        'Тайм-аут проверки номера сотрудника, отпечатка и пароля',
      IsapiEventType.faceVerifyPass => 'Проверка лица успешна',
      IsapiEventType.faceVerifyFail => 'Проверка лица не удалась',
      IsapiEventType.employeenoAndFaceVerifyPass =>
        'Проверка номера сотрудника и лица успешна',
      IsapiEventType.employeenoAndFaceVerifyFail =>
        'Проверка номера сотрудника и лица не удалась',
      IsapiEventType.employeenoAndFaceVerifyTimeout =>
        'Тайм-аут проверки номера сотрудника и лица',
      IsapiEventType.faceRecognizeFail => 'Распознавание лица не удалось',
      IsapiEventType.firstcardAuthorizeBegin =>
        'Начало авторизации первой картой',
      IsapiEventType.firstcardAuthorizeEnd => 'Конец авторизации первой картой',
      IsapiEventType.doorlockInputShortCircuit =>
        'Короткое замыкание входа замка двери',
      IsapiEventType.doorlockInputBrokenCircuit =>
        'Обрыв цепи входа замка двери',
      IsapiEventType.doorlockInputException => 'Исключение входа замка двери',
      IsapiEventType.doorcontactInputShortCircuit =>
        'Короткое замыкание входа датчика двери',
      IsapiEventType.doorcontactInputBrokenCircuit =>
        'Обрыв цепи входа датчика двери',
      IsapiEventType.doorcontactInputException =>
        'Исключение входа датчика двери',
      IsapiEventType.openbuttonInputShortCircuit =>
        'Короткое замыкание входа кнопки открытия',
      IsapiEventType.openbuttonInputBrokenCircuit =>
        'Обрыв цепи входа кнопки открытия',
      IsapiEventType.openbuttonInputException =>
        'Исключение входа кнопки открытия',
      IsapiEventType.doorlockOpenException => 'Исключение открытия замка двери',
      IsapiEventType.doorlockOpenTimeout => 'Тайм-аут открытия замка двери',
      IsapiEventType.firstcardOpenWithoutAuthorize =>
        'Открытие первой картой без авторизации',
      IsapiEventType.callLadderRelayBreak => 'Разрыв реле вызова лифта',
      IsapiEventType.callLadderRelayClose => 'Замыкание реле вызова лифта',
      IsapiEventType.autoKeyRelayBreak => 'Разрыв реле автоматического ключа',
      IsapiEventType.autoKeyRelayClose =>
        'Замыкание реле автоматического ключа',
      IsapiEventType.keyControlRelayBreak => 'Разрыв реле управления ключом',
      IsapiEventType.keyControlRelayClose => 'Замыкание реле управления ключом',
      IsapiEventType.employeenoAndPwPass =>
        'Проход по номеру сотрудника и паролю разрешен',
      IsapiEventType.employeenoAndPwFail =>
        'Проход по номеру сотрудника и паролю не удался',
      IsapiEventType.employeenoAndPwTimeout =>
        'Тайм-аут номера сотрудника и пароля',
      IsapiEventType.humanDetectFail => 'Обнаружение человека не удалось',
      IsapiEventType.peopleAndIdCardComparePass =>
        'Сравнение человека и ID карты успешно',
      IsapiEventType.peopleAndIdCardCompareFail =>
        'Сравнение человека и ID карты не удалось',
      IsapiEventType.certificateBlackList => 'Сертификат в черном списке',
      IsapiEventType.legalMessage => 'Разрешенное сообщение',
      IsapiEventType.illegalMessage => 'Неразрешенное сообщение',
      IsapiEventType.doorOpenOrDormantFail =>
        'Открытие двери или спящий режим не удались',
      IsapiEventType.authPlanDormantFail =>
        'План авторизации спящего режима не удался',
      IsapiEventType.cardEncryptVerifyFail =>
        'Проверка шифрования карты не удалась',
      IsapiEventType.submarinebackReplyFail => 'Ответ обратной связи не удался',
      IsapiEventType.doorOpenOrDormantOpenFail =>
        'Открытие двери или спящего режима не удалось',
      IsapiEventType.doorOpenOrDormantLinkageOpenFail =>
        'Открытие связки двери или спящего режима не удалось',
      IsapiEventType.trailing => 'Проникновение вслед',
      IsapiEventType.reverseAccess => 'Обратный доступ',
      IsapiEventType.forceAccess => 'Принудительный доступ',
      IsapiEventType.climbingOverGate => 'Перелезание через ворота',
      IsapiEventType.passingTimeout => 'Тайм-аут прохода',
      IsapiEventType.intrusionAlarm => 'Тревога вторжения',
      IsapiEventType.freeGatePassNotAuth =>
        'Свободный проход ворот без авторизации',
      IsapiEventType.dropArmBlock => 'Блокировка сброса барьера',
      IsapiEventType.dropArmBlockResume =>
        'Блокировка сброса барьера восстановлена',
      IsapiEventType.localFaceModelingFail =>
        'Локальное моделирование лица не удалось',
      IsapiEventType.stayEvent => 'Событие задержки',
      IsapiEventType.certificateAllowlistPass =>
        'Сертификат в белом списке - проход',
      IsapiEventType.certificateAllowlistFall =>
        'Сертификат в белом списке - отклонен',
      IsapiEventType.pswErrorOverTimes => 'Превышено количество ошибок пароля',
      IsapiEventType.idCardCollection => 'Сбор ID карт',
      IsapiEventType.pswVerifyFail => 'Проверка пароля не удалась',
      IsapiEventType.passwordMismatch => 'Несовпадение пароля',
      IsapiEventType.employeeNoNotExist => 'Номер сотрудника не существует',
      IsapiEventType.combinedVerifyPass => 'Комбинированная проверка успешна',
      IsapiEventType.combinedVerifyTimeout =>
        'Тайм-аут комбинированной проверки',
      IsapiEventType.verifyModeMismatch => 'Несовпадение режима проверки',
      IsapiEventType.orcodeVerifyPass => 'Проверка OR-кода успешна',
      IsapiEventType.orcodeVerifyFail => 'Проверка OR-кода не удалась',
      IsapiEventType.householderAuthorizePass =>
        'Авторизация домовладельца успешна',
      IsapiEventType.bluetoothVerifyPass => 'Проверка Bluetooth успешна',
      IsapiEventType.bluetoothVerifyFail => 'Проверка Bluetooth не удалась',
      IsapiEventType.passportVerifyFail => 'Проверка паспорта не удалась',
      IsapiEventType.informalMifareCardVerifyFail =>
        'Проверка неформальной Mifare карты не удалась',
      IsapiEventType.cpuCardEncryptVerifyFail =>
        'Проверка шифрования CPU карты не удалась',
      IsapiEventType.nfcDisableVerifyFail =>
        'Проверка отключенного NFC не удалась',
      IsapiEventType.loraModuleOnline => 'LoRa модуль в сети',
      IsapiEventType.loraModuleOffline => 'LoRa модуль не в сети',
      IsapiEventType.mqttStatus => 'Статус MQTT',
      IsapiEventType.emCardRecognizeNotEnabled =>
        'Распознавание EM карт не включено',
      IsapiEventType.m1CardRecognizeNotEnabled =>
        'Распознавание M1 карт не включено',
      IsapiEventType.cpuCardRecognizeNotEnabled =>
        'Распознавание CPU карт не включено',
      IsapiEventType.idCardRecognizeNotEnabled =>
        'Распознавание ID карт не включено',
      IsapiEventType.cardSetSecretKeyFail =>
        'Установка секретного ключа карты не удалась',
      IsapiEventType.localUpgradeFail => 'Локальное обновление не удалось',
      IsapiEventType.remoteUpgradeFail => 'Удаленное обновление не удалось',
      IsapiEventType.remoteExtendModuleUpgradeSucc =>
        'Удаленное обновление модуля расширения успешно',
      IsapiEventType.remoteExtendModuleUpgradeFail =>
        'Удаленное обновление модуля расширения не удалось',
      IsapiEventType.remoteFingerPrintModuleUpgradeSucc =>
        'Удаленное обновление модуля отпечатков успешно',
      IsapiEventType.remoteFingerPrintModuleUpgradeFail =>
        'Удаленное обновление модуля отпечатков не удалось',
      IsapiEventType.dynamiccodeVerifyPass =>
        'Проверка динамического кода успешна',
      IsapiEventType.dynamiccodeVerifyFail =>
        'Проверка динамического кода не удалась',
      IsapiEventType.passwdVerifyPass => 'Проверка пароля успешна',
      IsapiEventType.comsumeTimeout => 'Тайм-аут потребления',
      IsapiEventType.refundTimeout => 'Тайм-аут возврата',
      IsapiEventType.comsumeAmountOverlimit => 'Превышена сумма потребления',
      IsapiEventType.comsumeTimesOverlimit =>
        'Превышено количество потреблений',
      IsapiEventType.userComsumeEnsureTimeout =>
        'Тайм-аут подтверждения потребления пользователя',
      IsapiEventType.desfireCardEncryptVerifyFail =>
        'Проверка шифрования DESFire карты не удалась',
      IsapiEventType.desfireCardRecognizeNotEnabled =>
        'Распознавание DESFire карт не включено',
      IsapiEventType.irisVerifyPass => 'Проверка радужки успешна',
      IsapiEventType.irisVerifyFail => 'Проверка радужки не удалась',
      IsapiEventType.irisBioassayFail => 'Биоанализ радужки не удался',
      IsapiEventType.fullStaff => 'Полная загруженность',
      IsapiEventType.meetingNoSignin => 'Встреча - не зарегистрирован',
      IsapiEventType.meetingSignin => 'Встреча - зарегистрирован',
      IsapiEventType.meetingLate => 'Встреча - опоздание',
      IsapiEventType.interlockServerFailedResponse =>
        'Ошибка ответа сервера блокировки',
      IsapiEventType.fingerprintDisenabeldVerifyFail =>
        'Проверка отключенного отпечатка не удалась',
      IsapiEventType.faceDisenabeldVerifyFail =>
        'Проверка отключенного лица не удалась',
      IsapiEventType.monitorOpenDoor => 'Мониторинг открытия двери',
      IsapiEventType.readerFactoryReset => 'Заводской сброс считывателя',
      IsapiEventType.readerIdConflict => 'Конфликт ID считывателя',
      IsapiEventType.felicaCardRecognizeNotEnabled =>
        'Распознавание FeliCa карт не включено',
      IsapiEventType.propertyExceptionVerifyFail =>
        'Проверка исключения свойства не удалась',
      IsapiEventType.authenticationTimesReached =>
        'Достигнуто количество попыток аутентификации',
      IsapiEventType.orcodeKeyVerifyFail => 'Проверка ключа OR-кода не удалась',
      IsapiEventType.personPassThrough => 'Человек прошел',
      IsapiEventType.peopleAndSocialSecurityCardComparePass =>
        'Сравнение человека и соцкарты успешно',
      IsapiEventType.peopleAndSocialSecurityCardCompareFail =>
        'Сравнение человека и соцкарты не удалось',
      IsapiEventType.distractControllerUpgradeSucc =>
        'Обновление распределенного контроллера успешно',
      IsapiEventType.distractControllerUpgradeFail =>
        'Обновление распределенного контроллера не удалось',
      IsapiEventType.remoteImportUserData =>
        'Удаленный импорт данных пользователей',
      IsapiEventType.remoteExportUserData =>
        'Удаленный экспорт данных пользователей',
      IsapiEventType.vpAntiSpoofingFail => 'Защита от подмены VP не удалась',
      IsapiEventType.vpVerifyFail => 'Проверка VP не удалась',
      IsapiEventType.channelSecurityAreaOccupy =>
        'Занята зона безопасности канала',
      IsapiEventType.channelAntiPinchAreaOccupy =>
        'Занята зона защиты от зажима канала',
      IsapiEventType.channelMotorBrakeWorking =>
        'Работает тормоз двигателя канала',
      IsapiEventType.channelSelfCheckFail => 'Самопроверка канала не удалась',
      IsapiEventType.channelMotorSelfLearningFail =>
        'Самообучение двигателя канала не удалось',
      IsapiEventType.channelAlarmAreaNotOpenDoor =>
        'Зона тревоги канала - дверь не открывается',
      IsapiEventType.channelMotorDriveBoardException =>
        'Исключение платы привода двигателя канала',
      IsapiEventType.channelMotorEncodeException =>
        'Исключение кодировки двигателя канала',
      IsapiEventType.channelMotorOvercurrent =>
        'Перегрузка по току двигателя канала',
      IsapiEventType.channelMotorOvervoltage =>
        'Перенапряжение двигателя канала',
      IsapiEventType.channelMotorUndervoltage =>
        'Пониженное напряжение двигателя канала',
      IsapiEventType.channelMotorException => 'Исключение двигателя канала',
      IsapiEventType.channelPermissionAuthBlocked =>
        'Авторизация прав канала заблокирована',
      IsapiEventType.rmVerifyPass => 'RM проверка успешна',
      IsapiEventType.rmVerifyFail => 'RM проверка не удалась',
      IsapiEventType.doorLockDelay => 'Задержка замка двери',
      IsapiEventType.allowNouseDoor => 'Разрешена неиспользуемая дверь',
      IsapiEventType.cardAuthFail => 'Авторизация карты не удалась',

      // Legacy compatibility
      IsapiEventType.faceAuth => 'Аутентификация по лицу',
      IsapiEventType.doorOpened => 'Дверь открыта',
      IsapiEventType.doorClosed => 'Дверь закрыта',
      IsapiEventType.lockUnlocked => 'Замок разблокирован',
      IsapiEventType.lockLocked => 'Замок заблокирован',
      IsapiEventType.lockUnlockedFromApp => 'Замок разблокирован из приложения',
      IsapiEventType.unknown => 'Неизвестное событие',
    };
  }
}
