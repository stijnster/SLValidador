//
//  SLValidadorTests.m
//  SLValidadorTests
//
//  Created by Stijn Mathysen on 13/04/17.
//  Copyright © 2017 Stijn Mathysen. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SLValidador.h"

@interface SLValidadorTests : XCTestCase

@end

@implementation SLValidadorTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testNIF{
    SLValidador *validador = [[SLValidador alloc] init];
    NSInteger result = [validador vNif:@"12345678Z"];
    
    if(result != SLValidador_NIF_OK){
        XCTFail(@"Failed NIF validation returns %ld expected %ld", result, SLValidador_NIF_OK);
    }
}

- (void)testNIFExceptions{
    SLValidador *validador = [[SLValidador alloc] init];
    NSInteger result = [validador vNif:@"00000001R"];
    
    if(result != SLValidador_NIF_ERROR){
        XCTFail(@"Failed NIF validation returns %ld expected %ld", result, SLValidador_NIF_ERROR);
    }
}


- (void)testCIF{
    SLValidador *validador = [[SLValidador alloc] init];
    NSInteger result = [validador vNif:@"N0032484H"];

    if(result != SLValidador_CIF_EXTRANJERO_OK){
        XCTFail(@"Failed CIF validation returns %ld expected %ld", result, SLValidador_CIF_EXTRANJERO_OK);
    }

    result = [validador vNif:@"A58869389"];

    if(result != SLValidador_CIF_EXTRANJERO_OK){
        XCTFail(@"Failed CIF validation returns %ld expected %ld", result, SLValidador_CIF_EXTRANJERO_OK);
    }

    result = [validador vNif:@"A08015497"];
    
    if(result != SLValidador_CIF_EXTRANJERO_OK){
        XCTFail(@"Failed CIF validation returns %ld expected %ld", result, SLValidador_CIF_NORESIDENTES_OK);
    }
}



@end
