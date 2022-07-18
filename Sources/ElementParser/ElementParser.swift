import Foundation

public class ElementParser: NSObject, XMLParserDelegate {
    private let parentParser: ElementParser?

    private var element: Element
    private var childParsers: [ElementParser] = []

    func getElement(from xmlParser: XMLParser) -> Element {
        xmlParser.shouldProcessNamespaces = true
        xmlParser.delegate = self
        xmlParser.parse()
        return element
    }
    
    override init() {
        parentParser = nil
        element = .init(elementName: "", elements: [:])
        super.init()
    }
    
    private init(parser: XMLParser, elementName: String, attributeDict: [String : String], parent: ElementParser, parentElement: Element?) {
        self.parentParser = parent
        element = .init(elementName: elementName, characters: nil, attributeDict: attributeDict, elements: [:], parent: parentElement)
        super.init()
    }
    
    private func addChild(elementEnum: Element) {
        element.addElement(elementEnum: elementEnum)
    }
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        let child = ElementParser(parser: parser, elementName: elementName, attributeDict: attributeDict, parent: self, parentElement: element)
        childParsers.append(child)
        parser.delegate = child
    }
    
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        element.addCharacters(characters: string)
    }
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        parentParser?.addChild(elementEnum: element)
        parser.delegate = parentParser
    }
}

@dynamicMemberLookup
public class Element {
    internal init(elementName: String, characters: String? = nil, attributeDict: [String : String]? = nil, elements: [String : [Element]], parent: Element? = nil) {
        _elementName = elementName
        _characters = characters
        _attributeDict = attributeDict
        _elements = elements
        _parent = parent
    }
    
    private var _elementName: String
    private var _characters: String?
    private var _attributeDict: [String : String]?
    private var _elements: [String: [Element]]
    private var _parent: Element?

    subscript(dynamicMember member: String) -> Element? {
        return _elements[member]?[0]
    }
    
    subscript(index: Int) -> Element? {
        return _parent?._elements[_elementName]?[index]
    }
    
    
    func getElementName() -> String {
        return _elementName
    }
    
    func getStringValue() -> String? {
        return _characters
    }
    
    func getArrayValue() -> [Element]? {
        return _parent?._elements[_elementName]
    }
    
    func getAttributeValue(key: String) -> String? {
        return _attributeDict?[key]
    }
    
    fileprivate func addElement(elementEnum: Element) {
        var arr: [Element] = _elements[elementEnum.getElementName()] ?? []
        arr.append(elementEnum)
        _elements[elementEnum.getElementName()] = arr
    }
    
    fileprivate func addCharacters(characters: String) {
        var newCharacters: String
        if let characters = _characters {
            newCharacters = characters
        } else {
            newCharacters = ""
        }
        newCharacters.append(characters)
        _characters = newCharacters
    }
}
