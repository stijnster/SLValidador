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

- (void)testNIFFailures{
    SLValidador *validador = [[SLValidador alloc] init];
    NSInteger result = [validador vNif:@"12345678H"];
    
    if(result != SLValidador_NIF_ERROR_DC){
        XCTFail(@"Failed NIF validation returns %ld expected %ld", result, SLValidador_NIF_ERROR_DC);
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

    if(result != SLValidador_CIF_OK){
        XCTFail(@"Failed CIF validation returns %ld expected %ld", result, SLValidador_CIF_NORESIDENTES_OK);
    }

    result = [validador vNif:@"A08015497"];
    
    if(result != SLValidador_CIF_OK){
        XCTFail(@"Failed CIF validation returns %ld expected %ld", result, SLValidador_CIF_NORESIDENTES_OK);
    }

    result = [validador vNif:@"B83691469"];
    
    if(result != SLValidador_CIF_OK){
        XCTFail(@"Failed CIF validation returns %ld expected %ld", result, SLValidador_CIF_NORESIDENTES_OK);
    }

    
}

- (void)testCIFFailures{
    SLValidador *validador = [[SLValidador alloc] init];
    NSInteger result = [validador vNif:@"B83691468"];
    
    if(result != SLValidador_CIF_ERROR_DC){
        XCTFail(@"Failed CIF validation returns %ld expected %ld", result, SLValidador_CIF_ERROR_DC);
    }
}

-(void)testVariousNumbers{
    SLValidador *validador = [[SLValidador alloc] init];
    
    XCTAssert([validador vNif:@"  aaaa41d"] == SLValidador_NIF_ERROR_TAMANO, "wrong answer");
    XCTAssert([validador vNif:@"54aaaa41d"] == SLValidador_NIF_ERROR_CARACTERES, "wrong answer");
    XCTAssert([validador vNif:@"54"] == SLValidador_NIF_ERROR_TAMANO, "wrong answer");
    XCTAssert([validador vNif:@"A58818501"] == SLValidador_CIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"38119995W"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"F08216863"] == SLValidador_CIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"J22382949"] == SLValidador_CIF_NORESIDENTES_OK, "wrong answer");
    XCTAssert([validador vNif:@"P0200100F"] == SLValidador_CIF_ORGANIZACION_OK, "wrong answer");
    
    //DNIS1
    XCTAssert([validador vNif:@"62650219J"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"35761086L"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"07348726L"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"02363193N"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"29131633V"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"14758063K"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"71499401Z"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"39718897J"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"18076940K"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"01133210T"] == SLValidador_NIF_OK, "wrong answer");
    
    //DNIS2
    XCTAssert([validador vNif:@"61404140M"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"60088333M"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"93673759A"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"94158488F"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"84208059E"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"03293480H"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"52313106C"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"20430921K"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"44535312K"] == SLValidador_NIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"75910828H"] == SLValidador_NIF_OK, "wrong answer");
    
    //NIES1
    XCTAssert([validador vNif:@"Z5208783R"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    XCTAssert([validador vNif:@"Y9385597R"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    XCTAssert([validador vNif:@"Z6716416F"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    XCTAssert([validador vNif:@"X6514670N"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    XCTAssert([validador vNif:@"Z3294580L"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    XCTAssert([validador vNif:@"Y2718340F"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    XCTAssert([validador vNif:@"Z4555342J"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    XCTAssert([validador vNif:@"Z4572024C"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    XCTAssert([validador vNif:@"Y7613762V"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    XCTAssert([validador vNif:@"X3953244G"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");

    //NIES2
    XCTAssert([validador vNif:@"X5965007A"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    XCTAssert([validador vNif:@"X1061446L"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    XCTAssert([validador vNif:@"X8502916T"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    XCTAssert([validador vNif:@"Z4621338E"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    XCTAssert([validador vNif:@"X1699388X"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    XCTAssert([validador vNif:@"Y2388638X"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    XCTAssert([validador vNif:@"X0187312T"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    XCTAssert([validador vNif:@"X8099942D"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    XCTAssert([validador vNif:@"X2936278Y"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    XCTAssert([validador vNif:@"X3685367P"] == SLValidador_NIF_EXTRANJEROS, "wrong answer");
    
    //CIFS1
    XCTAssert([validador vNif:@"H06321491"] == SLValidador_CIF_NORESIDENTES_OK, "wrong answer");
    XCTAssert([validador vNif:@"C78970670"] == SLValidador_CIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"H24647794"] == SLValidador_CIF_NORESIDENTES_OK, "wrong answer");
    XCTAssert([validador vNif:@"B73081317"] == SLValidador_CIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"P0288479I"] == SLValidador_CIF_ORGANIZACION_OK, "wrong answer");
    XCTAssert([validador vNif:@"J37033826"] == SLValidador_CIF_NORESIDENTES_OK, "wrong answer");
    XCTAssert([validador vNif:@"D1225387H"] == SLValidador_CIF_EXTRANJERO_OK, "wrong answer");
    XCTAssert([validador vNif:@"Q5630031B"] == SLValidador_CIF_ORGANIZACION_OK, "wrong answer");
    XCTAssert([validador vNif:@"J3574987H"] == SLValidador_NIF_ERROR, "wrong answer");
    XCTAssert([validador vNif:@"D2086707C"] == SLValidador_CIF_EXTRANJERO_OK, "wrong answer");

    //CIFS2
    XCTAssert([validador vNif:@"B55294839"] == SLValidador_CIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"P3547062D"] == SLValidador_CIF_ORGANIZACION_OK, "wrong answer");
    XCTAssert([validador vNif:@"P8406183G"] == SLValidador_CIF_ORGANIZACION_OK, "wrong answer");
    XCTAssert([validador vNif:@"S7959527H"] == SLValidador_CIF_ORGANIZACION_OK, "wrong answer");
    XCTAssert([validador vNif:@"B07080641"] == SLValidador_CIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"P4733466I"] == SLValidador_CIF_ORGANIZACION_OK, "wrong answer");
    XCTAssert([validador vNif:@"S3083156D"] == SLValidador_CIF_ORGANIZACION_OK, "wrong answer");
    XCTAssert([validador vNif:@"F79247318"] == SLValidador_CIF_OK, "wrong answer");
    XCTAssert([validador vNif:@"S6981484F"] == SLValidador_CIF_ORGANIZACION_OK, "wrong answer");
    
    XCTAssert([validador vNif:@"V7937974I"] == SLValidador_NIF_ERROR, "wrong answer"); // ISSUE
}


@end
