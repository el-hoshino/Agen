import Cocoa
import AgenLib

let arguments = CommandLine.arguments
let parser = Parser()

do {
    let result = try parser.parse(arguments)
    switch result {
    case .showHelp:
        printHelp()
        
    case .showVersion:
        printVersion()
        
    case .shortenURLString(let result):
        let shortenURLString = result.urlString
        print("Shorten URL: \(shortenURLString)")
        if result.settings.shouldCopyToPasteboard {
            NSPasteboard.general.replacePasteboardItem(with: shortenURLString)
            print("Result has been copied to your clipboard, you can use cmd + v to paste it.")
        }
    }
    
    print()
    exit(EXIT_SUCCESS)
    
} catch let error {
    printError(error)
    exit(EXIT_FAILURE)
}
