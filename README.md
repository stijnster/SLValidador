SLValidador
===========

An objective-c class to validate Spanish NIF, DNI and CIF numbers.

## General

This class is a port of the official NIF, DNI and CIF library in Java, called "valnif", with version 2.0.1 provided by AEAT.

## Usage

```objective-c
SLValidador *validador = [[SLValidador alloc] init];
NSInteger result = [validador vNif:@"12345678Z"];

if(result == SLValidador_NIF_OK){
  NSLog(@"Woohoo!");
}
```

## Testing

A test application is included with a unit test, that covers every method in the class.

## Installation

Include the two SLValidador.* files, located in the Library folder into your project.

```objective-c
#import "SLValidador.h"
```

## Collaborate?

Fork me, make your change, write some tests and create a pull request!