import Foundation
import TelegramBotSDK

enum HelpType: String {
    case freeHand = "free-hands"
    case truck = "truck"
    case car = "car"
    case other = "other"
    
    case needAmmo = "ammunition"
    case needClothes = "clothes"
    case needMedicines = "medicines"
    case needTransport = "transport"
    case needHumHelp = "hum-help"
}

class Session {
    let sessionId: String
    
    var isRequestingInfo = false
    
    var inputState: InoutState = .fio
    
    var volounterName: String?
    var volounterCity: String?
    var volounterPhone: String?
    
    var carInfo: String?
    
    var helpType: HelpType?
    
    var additionalComment: String?
    
    init (id: String, commandType: HelpType? = nil) {
        self.sessionId = id
        self.helpType = commandType
    }
    
    func resetSession() {
        print("RESET SESSION: ", sessionId)
        isRequestingInfo = false
        inputState = .fio
        volounterName = nil
        volounterCity = nil
        volounterPhone = nil
        carInfo = nil
        helpType = nil
        additionalComment = nil
    }

}

enum InoutState: Int {

    case fio = 0
    case phone
    case city
    case carType
    case comment
}

struct Strings {
    static let giveContactInfo = "Надати доступ до контакту"
    
    static let restart = "На початок!"
    static let confirm = "Підтверджую!"
    static let enterAgain = "Ввести ще раз!"
    static let wantHelp = "- Хочу допомогти!"
    static let needHelp = "- Потребую допомоги!"
    static let dontWantNothing = "- Ні!"
    
    static let medicine = "Ліки"
    static let freeHands = "Вільні руки"
    static let clothes = "Одяг"
    static let carVan = "Авто (грузове)"
    static let car = "Авто (легкове)"
    static let money = "Кошти"
    static let otherHelp = "Інше (нестандартна допомога)"
    static let humHelp = "Гуманітарна допомога для переселенців"
    
    static let iAmMilitary = "Я ВІЙСЬКОВИЙ"
    static let iAmСivil = "Я ЦИВІЛЬНИЙ"
    
    static let iNeedMedicine = "Медикаменти"
    static let iNeedAmmo = "Військова амуніція"
    static let iNeedClothes = "Військовий одяг"
    static let iNeedTransport = "Транспорт"
    static let iNeedHumHelp = "Гуманітарна допомога"
    static let skipComment = "Пропустити"
}

struct Commands {
    static let start = "start"
    static let confirmEntering = Strings.confirm
    static let enterInfoAgain = Strings.enterAgain
    static let restart = "restart"
    static let restartAlt = Strings.restart
    static let canHelp = Strings.wantHelp
    static let needHelp = Strings.needHelp
    
    
    static let medicine = Strings.medicine
    static let clothes = Strings.clothes
    static let haveFreeHands = Strings.freeHands
    static let haveCarVan = Strings.carVan
    static let haveCar = Strings.car
    static let wantGiveCash = Strings.money
    static let humHelp = Strings.humHelp
    static let other = Strings.otherHelp
}

struct Messages {
    static let medicationInfo = "<i>Приймається за адресою:</i> <b>\nУжгород, вул. Гойди, 8\nРух підтримки закарпатських військових</b>\n\n<i>Ось що потрібно:</i> \n<b>-кровоспинні засоби</b>\n<b>-протиопікові</b>\n<b>-знеболюючі</b>\n<b>-бандажі</b>\n<b>-протизапальні</b>\n<b>-антибіотики</b>"
    
    static let clothesInfo = "<i>Приймається за адресою:</i> <b>\nУжгород, вул. Гойди, 8\nРух підтримки закарпатських військових\n\n</b><i>Ось що потрібно:</i> \n<b>-гірське взуття</b>\n<b>-термобілизна</b>\n<b>-спортивні утеплені штани</b>\n<b>-теплі куртки темного кольору/хакі</b>\n<b>-флісові светри</b>\n<b>-рукавиці</b>\n<b>-налобні ліхтарики</b>\n<b>-каремати</b>\n<b>-наколінники</b>\n<b>-спальники</b>\n<b>-бокси для індивідуальних аптечок (порожні)</b>\n<b>-аптечки (індивідуальні) повні</b>\n<b>-бафи</b>"
        
    static let askForFio = "Будь-ласка, введіть <b>ПІБ</b>, або надайте доступ (якщо вони привязані до акаунта)."
    static let askForPhone = "Будь-ласка, введіть <b>номер телефону</b>, або надайте доступ (якщо він вказаний в акаунті)."
    static let askForСity = "Будь-ласка, введіть <b>місто знаходження</b>."
    static let askForCarType = "Будь-ласка, введіть <b>марку та модель вашого авто</b>."
    static let askForAdditionalInfoForCar = "Будь-ласка, вкажіть особливі примітки <b>ОДНИМ ПОВІДОМЛЕННЯМ</b> \n<i>(ваш вік / грузопідйомність авто / корисний обєм ітд.)</i>"
    static let askForAdditionalComment = "Будь-ласка, при потребі вкажіть інші примітки, які зможуть описати вашу допомогу. <b>ОДНИМ ПОВІДОМЛЕННЯМ</b>"
    
    static let greatingMessageFormat = "<b>Вітаю!</b> \nЦе чат-бот <b>Руху підтримки закарпатських військових.</b> \n\nТи хочеш допомогти нашому війську здолати агресора?"
    
    static let noAnswer = "<b><i>-РУСКІЙ КОРАБЛЬ! ІДИ НАХ*Й!</i></b>"
    static let yesAnswer = "Виберіть категорію в якій маєте можливість допомогти!"
    
    static let unrecogniseMessageFormat = "<b>%@</b>, будь ласка слідуйте інструкціям, або розпочніть з початку!"
    static let whatCanYouHelpMessage = "Чим ви можете допомогти?"
    static let whoYouAre = "Оберіть свій статус: "
    static let whatHelpTypeDoYouNeed = "Оберіть категорію допомоги: "
    static let whatHelpDoYouNeed = "Опишіть проблему яка виникла! <b>Одним повідомленням</b>"
    static let whatHelpDoYouCanProceed = "Опишіть чим ви можете допомогти! <b>Одним повідомленням</b>"
    static let finishedMessageFormat = "<b>%@</b>, ми внесли Вас в базу, за потреби сконтактуємось. Дякуємо за виявлене бажання, ми це дуже цінуємо! \n\nТакож слідкуйте за новинами у спільнові. \n\nПосилання на спільноту: https://t.me/+hBDom9JohiZjZTU6"
    static let finishedHelpMessageFormat = "<b>%@</b>, ми внесли Вас в базу, та якнайскоріше звяжемося з вами для надання допомоги! \n\nТакож слідкуйте за новинами у спільнові. \n\nПосилання на спільноту: https://t.me/+hBDom9JohiZjZTU6"
    
    static let humHelpMessage = "Гуманітарна допомога для переселенців приймається за адресою: \n<b>м. Ужгород, вул. Ференца Ракоці, 2 («Совине гніздо») - Цілодобовий пункт розподілу населення</b>"
    
    static let needHumHelpMessage = "Зверніться в <b>Цілодобовий координаційний центр Ужгородської міськради</b> за адресою: \n\n<b>м. Ужгород, вул. Ференца Ракоці, 2 («Совине гніздо»)</b> \n\n0312428029\n0312428030\n0312613220\n0509905011\n15-67"
    
    static let moneyRecvisitsMessage = "Дякуємо, ось як ви можете їх пожертвувати: \n\n<b>Готівка приймається за адресою:</b>\nУжгород, вул. Гойди, 8\nРух підтримки закарпатських військових\n\n<b>Безготівкові перерахунки:</b> \n\n<b>Для іноземців</b>: \n\n<b>For cash:</b> \n<b>Name of the bank CB:</b> 1D Hrushevskoho str., Kyiv, 01001, Ukraine \n<b>MFO (Interbranch Turnover)</b> - 305299 \n<b>Recipient</b> - Skunts Mykola (Скунць Микола Петрович)\n<b>IBAN</b> - UA323052990000026201678468315\n<b>Recipient account</b> - 26201678468315\n<b>Currency</b> - UAH\n<b>Taxpayer identification number</b> - 2443402437\n<b>Purpose of payment</b> - money transfer to\nSkunts Mykola \n\n<b>В Україні:</b>\nКартки для грошової допомоги, ПриватБанк і monobank:\n4731 2196 1388 2293\n\n4441 1144 1046 2012\n<b>Отримувач:</b> Скунць Микола Петрович\n\n<b>Кошти із-за кордону USD:\nBeneficiary (Бенефіціар)</b>\n<b>IBAN</b>\nUA 88 322001 00000 2620 5313 7972 08\n<b>Account No</b>\n26205313797208\n<b>Receiver</b>\nYARTSEVA HALYNA, 88005, Ukraine, reg. Zakarpatska, c. Uzhhorod, st. Hulaka-Artemovskoho, build. 14/41, fl. 10\n<b>Account with Institution (Банк Бенефіціара):</b>\nBank JSC UNIVERSAL BANK\n<b>City</b>\nKYIV, UKRAINE\n<b>Swift code</b>\nUNJSUAUKXXX\n<b>Details of payment (Призначення платежу)</b>\nДомомога військовим"
    
    static let thanksFooter = "\n\nДякуємо за виявлене бажання, ми це дуже цінуємо! \n\nТакож слідкуйте за новинами у спільнові. \n\nПосилання на спільноту: https://t.me/+hBDom9JohiZjZTU6"
}


let token = "5241930557:AAFmUeZpcfDbpk6N7bycOrjabSpzbxcLr78"
let bot = TelegramBot(token: token)

func getSession(for chat: Chat) -> Session {
    if let session = sessions.first(where: { $0.sessionId == String(chat.id) }) {
        return session
    } else {
        let newSession = Session(id: String(chat.id))
        print("NEW SESSION: ", String(chat.id))
        sessions.append(newSession)
        return newSession
    }
}

var sessions: [Session] = []
let router = Router(bot: bot) { router in
    router[Commands.start] = onStart
    router[Commands.restart] = onStart
    router[Commands.restartAlt] = onStart
    
    router[Commands.canHelp] = onCanHelp
    router[Commands.needHelp] = onNeedHelp
    router[Strings.dontWantNothing] = onRussinShipIdiNahui
    
    router[Commands.medicine] = onHaveMedication
    router[Commands.clothes] = onHaveClothes
    router[Commands.haveCarVan] = onHaveCarVan
    router[Commands.haveCar] = onHaveCar
    router[Commands.wantGiveCash] = onMoneyDonate
    router[Commands.haveFreeHands] = onHaveFreeHands
    router[Commands.humHelp] = onHaveHumHelp
    router[Commands.other] = onOtheHelp
    
    router[Commands.confirmEntering] = onSaveToDB
    router[Commands.enterInfoAgain] = onEnterInfoAgain
    
    router[Strings.iAmСivil] = onCivilNeedHelp
    router[Strings.iAmMilitary] = onMilitaryNeedHelp
    
    router[Strings.iNeedMedicine] = onNeedMedicineHelp
    router[Strings.iNeedAmmo] = onNeedAmmoHelp
    router[Strings.iNeedClothes] = onNeedClothesHelp
    router[Strings.iNeedTransport] = onNeedTransportHelp
    router[Strings.iNeedHumHelp] = onNeedHumHelp
    router[Strings.skipComment] = onSkipComment
    router.unmatched = onUnrecogniseCommand
    router.unsupportedContentType = onUnrecogniseCommand
}

func removeKeyboardReply() -> ReplyMarkup {
    return ReplyMarkup.replyKeyboardRemove(ReplyKeyboardRemove(removeKeyboard: true))
}

func onStart(context: Context) throws -> Bool {
    let keyboardMarkup = ReplyKeyboardMarkup.init(keyboard: startButtonsMarkup, resizeKeyboard: true, oneTimeKeyboard: false, selective: true)
    let bottomMenu = ReplyMarkup.replyKeyboardMarkup(keyboardMarkup)
    resetSession(for: context)
    context.respondAsync(String(format: Messages.greatingMessageFormat, context.message?.from?.firstName ?? context.message?.from?.username ?? "шановний"), parseMode: .html, replyMarkup: bottomMenu)
    return true
}

func onCanHelp(context: Context) throws -> Bool {
    let keyboardMarkup = ReplyKeyboardMarkup.init(keyboard: canHelpButtonsMarkup, resizeKeyboard: true, oneTimeKeyboard: false, selective: true)
    let bottomMenu = ReplyMarkup.replyKeyboardMarkup(keyboardMarkup)
    context.respondAsync(Messages.whatCanYouHelpMessage, replyMarkup: bottomMenu)
    return true
}

func onNeedHelp(context: Context) throws -> Bool {
    context.respondAsync(Messages.whoYouAre, parseMode: .html, replyMarkup: askHelpTypeRequestMarkup)
    return true
}

func onCivilNeedHelp(context: Context) throws -> Bool {
    context.respondAsync(Messages.needHumHelpMessage, parseMode: .html, replyMarkup: reStartButtonsMarkup)
    return true
}

func onMilitaryNeedHelp(context: Context) throws -> Bool {
    context.respondAsync(Messages.whatHelpTypeDoYouNeed, parseMode: .html, replyMarkup: needHelpButtonsMarkup)
    return true
}

func onNeedMedicineHelp(context: Context) throws -> Bool {
    if let chat = context.message?.chat {
        initiateContactInfoRequestForVolounterType(type: .needMedicines, for: chat)
    }
    return true
}

func onNeedAmmoHelp(context: Context) throws -> Bool {
    if let chat = context.message?.chat {
        initiateContactInfoRequestForVolounterType(type: .needAmmo, for: chat)
    }
    return true
}

func onNeedClothesHelp(context: Context) throws -> Bool {
    if let chat = context.message?.chat {
        initiateContactInfoRequestForVolounterType(type: .needClothes, for: chat)
    }
    return true
}

func onNeedTransportHelp(context: Context) throws -> Bool {
    if let chat = context.message?.chat {
        initiateContactInfoRequestForVolounterType(type: .needTransport, for: chat)
    }
    return true
}

func onNeedHumHelp(context: Context) throws -> Bool {
    if let chat = context.message?.chat {
        initiateContactInfoRequestForVolounterType(type: .needHumHelp, for: chat)
    }
    return true
}

func onRussinShipIdiNahui(context: Context) throws -> Bool {
    context.respondAsync(Messages.noAnswer, parseMode: .html, replyMarkup: removeKeyboardReply())
    return true
}

func onHaveMedication(context: Context) throws -> Bool {
    context.respondAsync(Messages.medicationInfo + Messages.thanksFooter, parseMode: .html, replyMarkup: reStartButtonsMarkup)
    return true
}

func onHaveClothes(context: Context) throws -> Bool {
    context.respondAsync(Messages.clothesInfo + Messages.thanksFooter, parseMode: .html, replyMarkup: reStartButtonsMarkup)
    return true
}

func onHaveFreeHands(context: Context) throws -> Bool {
    if let chat = context.message?.chat {
        initiateContactInfoRequestForVolounterType(type: .freeHand, for: chat)
    }
    return true
}

func onHaveHumHelp(context: Context) throws -> Bool {
    context.respondAsync(Messages.humHelpMessage, parseMode: .html, replyMarkup: reStartButtonsMarkup)
    return true
}

func onHaveCarVan(context: Context) throws -> Bool {
    if let chat = context.message?.chat {
        initiateContactInfoRequestForVolounterType(type: .truck, for: chat)
    }
    return true
}

func onHaveCar(context: Context) throws -> Bool {
    if let chat = context.message?.chat {
        initiateContactInfoRequestForVolounterType(type: .car, for: chat)
    }
    return true
}

func onMoneyDonate(context: Context) throws -> Bool {
    context.respondAsync(Messages.moneyRecvisitsMessage, parseMode: .html, replyMarkup: reStartButtonsMarkup)
    return true
}

func onOtheHelp(context: Context) throws -> Bool {
    if let chat = context.message?.chat {
        initiateContactInfoRequestForVolounterType(type: .other, for: chat)
    }
    return true
}

func onEnterInfoAgain(context: Context) throws -> Bool {
    guard let chat = context.message?.chat else { return false }
    let currentSession = getSession(for: chat)
    initiateContactInfoRequestForVolounterType(type: currentSession.helpType ?? .other, for: chat)
    return true
}

func onSkipComment(context: Context) throws -> Bool {
    guard let chat = context.message?.chat else { return false }
    let currentSession = getSession(for: chat)
    sendConfimMessage(to: chat, session: currentSession)
    return true
}

func onSaveToDB(context: Context) throws -> Bool {
    let currentSession = getSession(for: context.message!.chat)
    sendToDB(session: currentSession, context: context)
    return true
}

func onUnrecogniseCommand(context: Context) throws -> Bool {
    guard let chat = context.message?.chat else {
        return false
    }
    let session = getSession(for: chat)
    if session.isRequestingInfo {
        switch session.inputState {
        case .fio:
            if let contact = context.message?.contact {
                var name = contact.firstName
                if let lastName = contact.lastName {
                    name += " " + lastName
                }
                session.volounterName = name
            } else if let enteredName = context.message?.text {
                session.volounterName = enteredName
            }
            if let _ = session.volounterName {
                askForPhone(for: chat)
            } else {
                sendMessage(to: chat, message: "Ваші відомості не містять даних ПІП! Введіть будь-ласка вручну!")
            }
        case .phone:
            if let contactPhone = context.message?.contact?.phoneNumber {
                session.volounterPhone = contactPhone
            } else if let enteredPhone = context.message?.text {
                session.volounterPhone = enteredPhone
            }
            if let _ = session.volounterPhone {
                askForCity(for: chat)
            } else {
                sendMessage(to: chat, message: "Ваші відомості не містять номеру телефону! Введіть будь-ласка вручну!")
            }
        case .city:
            session.volounterCity = context.message?.text
            if session.helpType == .car || session.helpType == .truck {
                askForCarInfo(for: chat)
            } else if let _ = [HelpType.needAmmo, HelpType.needHumHelp, HelpType.needTransport, HelpType.needMedicines, HelpType.needClothes].firstIndex(of: session.helpType) {
                askForHelpReason(for: chat)
            } else {
                askForAdditionalComment(for: chat)
            }
        case .carType:
            session.carInfo = context.message?.text
            askForAdditionalCarInfo(for: chat)
        case .comment:
            session.additionalComment = context.message?.text
            sendConfimMessage(to: chat, session: session)
        }
        return true
    }
    return false
}

func initiateContactInfoRequestForVolounterType(type: HelpType, for chat: Chat) {
    let session = getSession(for: chat)
    session.helpType = type
    askForFio(for: chat)
}

func askForFio(for toChat: Chat?) {
    guard let chat = toChat else  { return }
    let session = getSession(for: chat)
    print("session: ", session.sessionId)
    session.isRequestingInfo = true
    session.inputState = .fio
    bot.sendMessageAsync(chatId: .chat(chat.id), text: Messages.askForFio, parseMode: .html, replyMarkup: ReplyMarkup.replyKeyboardMarkup(ReplyKeyboardMarkup(keyboard: askContactInfo, resizeKeyboard: true, oneTimeKeyboard: true, selective: true)))
}

func askForPhone(for toChat: Chat?) {
    guard let chat = toChat else  { return }
    let session = getSession(for: chat)
    session.isRequestingInfo = true
    session.inputState = .phone
    bot.sendMessageAsync(chatId: .chat(chat.id), text: Messages.askForPhone, parseMode: .html, replyMarkup: ReplyMarkup.replyKeyboardMarkup(ReplyKeyboardMarkup(keyboard: askContactInfo, resizeKeyboard: true, oneTimeKeyboard: true, selective: true)))
}

func askForCity(for toChat: Chat?) {
    guard let chat = toChat else  { return }
    let session = getSession(for: chat)
    session.isRequestingInfo = true
    session.inputState = .city
    bot.sendMessageAsync(chatId: .chat(chat.id), text: Messages.askForСity, parseMode: .html, replyMarkup: removeKeyboardReply())
}

func askForCarInfo(for toChat: Chat?) {
    guard let chat = toChat else  { return }
    let session = getSession(for: chat)
    session.isRequestingInfo = true
    session.inputState = .carType
    bot.sendMessageAsync(chatId: .chat(chat.id), text: Messages.askForCarType, parseMode: .html, replyMarkup: removeKeyboardReply())
}

func askForAdditionalCarInfo(for toChat: Chat?) {
    guard let chat = toChat else  { return }
    let session = getSession(for: chat)
    session.isRequestingInfo = true
    session.inputState = .comment
    bot.sendMessageAsync(chatId: .chat(chat.id), text: Messages.askForAdditionalInfoForCar, parseMode: .html, replyMarkup: removeKeyboardReply())
}

func askForAdditionalComment(for toChat: Chat?) {
    guard let chat = toChat else  { return }
    let session = getSession(for: chat)
    session.isRequestingInfo = true
    session.inputState = .comment
    bot.sendMessageAsync(chatId: .chat(chat.id), text: Messages.askForAdditionalComment, parseMode: .html, replyMarkup: skipMarkup)
}

func askForHelpReason(for toChat: Chat?) {
    guard let chat = toChat else  { return }
    let session = getSession(for: chat)
    session.isRequestingInfo = true
    session.inputState = .comment
    bot.sendMessageAsync(chatId: .chat(chat.id), text: Messages.whatHelpDoYouNeed, parseMode: .html, replyMarkup: removeKeyboardReply())
}

func resetSession(for context: Context) {
    let session = getSession(for: context.message!.chat)
    session.resetSession()
}

func sendToDB(session: Session, context: Context) {
    var path = "bot/volonteer"
    if let _ = [HelpType.needAmmo, HelpType.needHumHelp, HelpType.needTransport, HelpType.needMedicines, HelpType.needClothes].firstIndex(of: session.helpType) {
        path = "bot/help-request"
    }
    var request = URLRequest(url: URL(string: "http://ruhpidtrymky-env.eba-3nexsm5k.eu-central-1.elasticbeanstalk.com/" + path)!)
    request.addValue("Bearer b7e6abddeb810910075037bf939d7a47f928f961c4778cc6cc0780ee7f3c4479", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    var comment = ""
    if session.helpType == .car || session.helpType == .truck {
        comment = "Автомобіль: "
        comment += "\n" + (session.carInfo ?? "") + "\n"
    }
    comment += (session.additionalComment ?? "")
    
    let json = [
        "pib": session.volounterName,
        "location": session.volounterCity,
        "phone": session.volounterPhone,
        "helpType": session.helpType?.rawValue ?? "",
        "comment": comment
    ]
    
    let data = try! JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)
    request.httpBody = data
    print("URL: ", request.url!)
    print("BODY: ", json)
    
    
    NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) { response, data, error in
        if let httpResponse = response as? HTTPURLResponse {
            print("STATUS CODE: ", httpResponse.statusCode)
            print("ERROD: ", error?.localizedDescription)
            let json = try! JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
            print("DATA: ", json)
            if httpResponse.statusCode >= 200 && httpResponse.statusCode < 400 {
                if let _ = [HelpType.needAmmo, HelpType.needHumHelp, HelpType.needTransport, HelpType.needMedicines, HelpType.needClothes].firstIndex(of: session.helpType) {
                    sendSuccessHelpMessage(context: context)
                } else {
                    sendSuccessVolountersMessage(context: context)
                }
                resetSession(for: context)
            } else {
                sendFallBackMessage(to: context.message!.chat)
            }
        }
    }
    
}

//Buttons

let askContactInfo = [
    [KeyboardButton(text: Strings.giveContactInfo, requestContact: true)]
]

let skipMarkup: ReplyMarkup = {
    return ReplyMarkup.replyKeyboardMarkup(ReplyKeyboardMarkup.init(keyboard: [[KeyboardButton(text: Strings.skipComment)]], resizeKeyboard: true, oneTimeKeyboard: true, selective: true))
}()

let askHelpTypeRequestMarkup: ReplyMarkup = {
    return ReplyMarkup.replyKeyboardMarkup(ReplyKeyboardMarkup.init(keyboard: [[KeyboardButton(text: Strings.iAmMilitary), KeyboardButton(text: Strings.iAmСivil)]], resizeKeyboard: true, oneTimeKeyboard: true, selective: true))
}()

let reStartButtonsMarkup: ReplyMarkup = {
    return ReplyMarkup.replyKeyboardMarkup(ReplyKeyboardMarkup.init(keyboard: [[KeyboardButton(text: Strings.restart)]], resizeKeyboard: true, oneTimeKeyboard: true, selective: true))
}()

let confirmButtonsMarkup = [
    [KeyboardButton(text: Strings.enterAgain), KeyboardButton(text: Strings.confirm)]
]

let startButtonsMarkup = [
    [KeyboardButton(text: Strings.wantHelp), KeyboardButton(text: Strings.needHelp), KeyboardButton(text: Strings.dontWantNothing)]
]

let canHelpButtonsMarkup = [
    [KeyboardButton(text: Strings.medicine), KeyboardButton(text: Strings.clothes)],
    [KeyboardButton(text: Strings.carVan), KeyboardButton(text: Strings.car)],
    [KeyboardButton(text: Strings.money), KeyboardButton(text: Strings.freeHands)],
    [KeyboardButton(text: Strings.humHelp), KeyboardButton(text: Strings.otherHelp)]
]


let needHelpButtonsMarkup: ReplyMarkup = {
    return ReplyMarkup.replyKeyboardMarkup(ReplyKeyboardMarkup.init(keyboard: [
        [KeyboardButton(text: Strings.iNeedAmmo), KeyboardButton(text: Strings.iNeedClothes)],
        [KeyboardButton(text: Strings.iNeedMedicine), KeyboardButton(text: Strings.iNeedTransport)],
        [KeyboardButton(text: Strings.iNeedHumHelp)]], resizeKeyboard: true, oneTimeKeyboard: true, selective: true))
}()

while let update = bot.nextUpdateSync() {
    let handled =  try router.process(update: update)
    if !handled {
        if let chat = update.message?.chat {
            sendUnrecogniseMessage(to: chat)
        }
    }
}

func sendMessage(to chat: Chat, message: String) {
    bot.sendMessageAsync(chatId: .chat(chat.id), text: message, parseMode: .html)
}

func sendFallBackMessage(to chat: Chat, message: String = "Упс, щось пішло не так!") {
    bot.sendMessageAsync(chatId: .chat(chat.id), text: message, parseMode: .html, replyMarkup: reStartButtonsMarkup)
}

func sendGreating(to chat: Chat) {
    bot.sendMessageSync(chatId: .chat(chat.id), text: String(format: Messages.greatingMessageFormat, chat.firstName ?? chat.username ?? "шановний"), parseMode: .html)
}

func sendUnrecogniseMessage(to chat: Chat) {
    bot.sendMessageSync(chatId: .chat(chat.id), text: String(format: Messages.unrecogniseMessageFormat, chat.firstName ?? chat.username ?? "шановний"), parseMode: .html, replyMarkup: reStartButtonsMarkup)
}

func sendConfimMessage(to chat: Chat, session: Session) {
    var message = "Перевірте дані:\n\n"
    message += "<b>ПІП:</b>\n"
    message += session.volounterName ?? ""
    message += "\n<b>Номер телефону:</b>\n"
    message += session.volounterPhone ?? ""
    message += "\n<b>Місцезнаходження:</b>\n"
    message += session.volounterCity ?? ""
    
    switch session.helpType {
    case .car, .truck:
            message += "\n<b>Автомобіль:</b>\n"
            message += session.carInfo ?? ""
        default: break
    }
    
    if !(session.additionalComment ?? "").isEmpty {
        message += "\n<b>Коментар:</b>\n"
        message += session.additionalComment ?? ""
    }
    
    bot.sendMessageAsync(chatId: .chat(chat.id), text: message, parseMode: .html, replyMarkup: ReplyMarkup.replyKeyboardMarkup(ReplyKeyboardMarkup(keyboard: confirmButtonsMarkup, resizeKeyboard: true, oneTimeKeyboard: true, selective: true)))
}

func sendSuccessVolountersMessage(context: Context) {
    context.respondAsync(String(format: Messages.finishedMessageFormat, context.message?.from?.firstName ?? context.message?.from?.username ?? "шановний"), parseMode: .html, replyMarkup: reStartButtonsMarkup)
}

func sendSuccessHelpMessage(context: Context) {
    context.respondAsync(String(format: Messages.finishedHelpMessageFormat, context.message?.from?.firstName ?? context.message?.from?.username ?? "шановний"), parseMode: .html, replyMarkup: reStartButtonsMarkup)
}


fatalError("Server stopped due to error: \(String(describing: bot.lastError))")
