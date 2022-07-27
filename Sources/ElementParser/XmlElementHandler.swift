import Foundation

public class XmlElementHandler: NSObject, XMLParserDelegate {
    private let parentParser: XmlElementHandler?
    
    private var element: Element
    private var childParser: XmlElementHandler?
    
    override init() {
        parentParser = nil
        element = .init(elementName: "", elements: [:])
        super.init()
    }
    
    private init(parser: XMLParser, elementName: String, attributeDict: [String : String], parent: XmlElementHandler, parentElement: Element?) {
        self.parentParser = parent
        element = .init(elementName: elementName, characters: nil, attributeDict: attributeDict, elements: [:], parent: parentElement)
        super.init()
    }
    
    func getElement(from xmlParser: XMLParser) -> Element {
        xmlParser.shouldProcessNamespaces = true
        xmlParser.delegate = self
        xmlParser.parse()
        return element
    }
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        let child = XmlElementHandler(parser: parser, elementName: elementName, attributeDict: attributeDict, parent: self, parentElement: element)
        childParser = child
        parser.delegate = child
    }
    
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        element.addCharacters(characters: string)
    }
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        parentParser?.addChild(elementEnum: element)
        parser.delegate = parentParser
    }
    
    private func addChild(elementEnum: Element) {
        element.addElement(elementEnum: elementEnum)
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
    
    func getName() -> String {
        return _elementName
    }
    
    func getStringValue() -> String? {
        return _characters
    }
    
    func getArrayValue() -> [Element]? {
        return _parent?._elements[_elementName]
    }
    
    func getAttributeDict() -> [String : String]? {
        return _attributeDict
    }
    
    func getAttributeValue(key: String) -> String? {
        return _attributeDict?[key]
    }
    
    fileprivate func addElement(elementEnum: Element) {
        var arr: [Element] = _elements[elementEnum.getName()] ?? []
        arr.append(elementEnum)
        _elements[elementEnum.getName()] = arr
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
