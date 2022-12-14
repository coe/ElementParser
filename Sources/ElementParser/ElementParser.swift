import Foundation

public class ElementParser: NSObject, XMLParserDelegate {
    private let parentParser: ElementParser?
    
    private var element: Element
    private var childParser: ElementParser?
    
    public override init() {
        parentParser = nil
        element = .init(elementName: "", elements: [:])
        super.init()
    }
    
    private init(parser: XMLParser, elementName: String, attributeDict: [String : String], parent: ElementParser, parentElement: Element?) {
        self.parentParser = parent
        element = .init(elementName: elementName, characters: nil, attributeDict: attributeDict, elements: [:], parent: parentElement)
        super.init()
    }
    
    public func getDocument(from xmlParser: XMLParser) -> Element {
        xmlParser.shouldProcessNamespaces = true
        xmlParser.delegate = self
        xmlParser.parse()
        return element
    }
    
public func parser(_ parser: XMLParser,
                   didStartElement elementName: String,
                   namespaceURI: String?,
                   qualifiedName qName: String?,
                   attributes attributeDict: [String : String] = [:]) {
    let child = ElementParser(parser: parser,
                              elementName: elementName,
                              attributeDict: attributeDict,
                              parent: self,
                              parentElement: element)
    childParser = child
    parser.delegate = child
}
    
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        element.addCharacters(characters: string)
    }
    
public func parser(_ parser: XMLParser,
                    didEndElement elementName: String,
                    namespaceURI: String?,
                    qualifiedName qName: String?) {
    parentParser?.addChild(element)
    parser.delegate = parentParser
}
    
private func addChild(_ child: Element) {
    element.addElement(child)
}
}

@dynamicMemberLookup
public class Element {
    private var _elements: [String: [Element]]

    public subscript(dynamicMember member: String) -> Element? {
        return _elements[member]?[0]
    }
    
    public subscript(index: Int) -> Element? {
        return _parent?._elements[_elementName]?[index]
    }
    
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
    private var _parent: Element?
    

    
    public func getName() -> String {
        return _elementName
    }
    
    public func getStringValue() -> String? {
        return _characters
    }
    
    public func getArrayValue() -> [Element]? {
        return _parent?._elements[_elementName]
    }
    
    public func getAttributeDict() -> [String : String]? {
        return _attributeDict
    }
    
    public func getAttributeValue(key: String) -> String? {
        return _attributeDict?[key]
    }
    
    fileprivate func addElement(_ element: Element) {
        var elements: [Element] = _elements[element.getName()] ?? []
        elements.append(element)
        _elements[element.getName()] = elements
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
