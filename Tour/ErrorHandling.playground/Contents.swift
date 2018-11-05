// represent errors
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// throw an error
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

// handle errors
//*** do catch
do {
    let printerResponse = try send(job: 1000, toPrinter: "Bi Sheng")
    print("in do catch 1: \(printerResponse)")
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1400, toPrinter: "Gutenberg")
    print("in do catch 2: \(printerResponse)")
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

//*** re-throw error
func rethrowError() throws -> Void {
    let printerResponse = try send(job: 8989, toPrinter: "Reprinter")
    print("in re-throw func: \(printerResponse)")
}
do {
    try rethrowError()
} catch {
    print(error)
}

//*** try to get optional value
let printerSuccess = try? send(job: 1800, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1850, toPrinter: "Never Has Toner")

//*** try! => do or die
let printerResponse = try! send(job: 9999, toPrinter: "Do or Die")

// defer
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("milk")
print(fridgeIsOpen)
