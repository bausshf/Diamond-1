/**
* Copyright © DiamondMVC 2018
* License: MIT (https://github.com/DiamondMVC/Diamond/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module diamond.html.htmldocument;

import diamond.html.htmlexception;
import diamond.dom.domdocument;
import diamond.dom.domnode;
import diamond.html.htmlnode;

/// An HTML document.
final class HtmlDocument : DomDocument
{
  private:
  /// The root nodes.
  HtmlNode[] _rootNodes;
  /// The doctype node.
  HtmlNode _doctype;
  /// The head node.
  HtmlNode _head;
  /// The body node.
  HtmlNode _body;

  public:
  final:
  /// Creates a new html document.
  this() @safe
  {
    super();
  }

  /**
  * Parses the elements from the dom to the document.
  * Params:
  *   elements = The parsed dom elements.
  */
  override void parseElements(DomNode[] elements) @safe
  {
    if (!elements)
    {
      return;
    }

    foreach (element; elements)
    {
      import std.string : toLower;

      if (element.name.toLower() == "doctype")
      {
        _doctype = element;
      }
      else if (element.name.toLower() == "head")
      {
        _head = element;
      }
      else if (element.name.toLower() == "body")
      {
        _body = element;
      }
      else
      {
        if (element.name.toLower() == "html")
        {
          if (element.children)
          {
            foreach (child; element.children)
            {
              if (child.name.toLower() == "head")
              {
                _head = child;
              }
              else if (child.name.toLower() == "body")
              {
                _body = child;
              }
            }
          }
        }

        _rootNodes ~= element;
      }
    }
  }

  @property
  {
    /// Gets the root nodes of the html document.
    HtmlNode[] rootNodes() @safe { return _rootNodes; }

    /// Sets the root nodes of the html document.
    void root(HtmlNode[] nodes) @safe
    {
      _rootNodes = nodes;

      if (!_rootNodes)
      {
        return;
      }

      foreach (element; _rootNodes)
      {
        import std.string : toLower;

        if (element.name.toLower() == "doctype")
        {
          _doctype = element;
        }
        else if (element.name.toLower() == "head")
        {
          _head = element;
        }
        else if (element.name.toLower() == "body")
        {
          _body = element;
        }
        else if (element.name.toLower() == "html")
        {
          if (element.children)
          {
            foreach (child; element.children)
            {
              if (child.name.toLower() == "head")
              {
                _head = child;
              }
              else if (child.name.toLower() == "body")
              {
                _body = child;
              }
            }
          }
        }
      }
    }

    /// Gets the head node.
    HtmlNode head() @safe { return _head; }

    /// Gets the body node.
    HtmlNode body() @safe { return _body; }
  }

  /**
  * Converts the html document to a properly formatted html document-string.
  * Returns:
  *   A string equivalent to the properly formatted html document-string.
  */
  override string toString() @safe
  {
    import std.array : join, array;
    import std.algorithm : map;
    import std.string : format;

    return (_doctype ? "<!%s %s>\r\n".format(_doctype.name, _doctype.getAttributes().map!(a => a.value ? "%s=\"%s\"".format(a.name, a.value) : a.name).array.join(" ")) : "") ~ (_rootNodes ? join(_rootNodes.map!(n => n.toString).array, "\r\n") : "");
  }
}