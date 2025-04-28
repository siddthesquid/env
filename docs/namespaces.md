# Global Uniqueness Protocol

This document describes a language agnostic algorithm for defining contextually unique identifiers.

- "Contextually" meaning that it is only unique within a certain context
- However, the algorithm allows lifting identifiers to be unique within another context
- There is a "global" context in which all identifiers are unique
- two nodes with irrelevant contexts can have the same identifiers

# Naming things

```
[domain]-name-(type)
[root]-[child]-name-(subtype)-(type)

Algorithm:

(identifier) => {
  [rest, type] = parse_type(identifier)
  [domain, rest] = parse_domain(identifier)
  name = rest

  return [domain, name, type]
}
    
```

# Vocabulary

- domain : string[]
- context : {
    hash: namespace => unique string
    get: (i: string[]) => T
}
- namespace : string
- entity : context | value
- identifier : string[] = domain + namespace

- hash

- node
- router
- leaf
- key
- value
- parent
- child
- sibling

# Namespace types

- static: the children must be defined, but can have different context types
- dynamic: children can be managed dynamically, but context types must be the same
    - if you want a dynamic node with children of different context types, then transform it into a static node and separate by context type, then make the subsequent nodes 

Given a context `C`, 
