//
//  SLValidador.h
//  SLValidador
//
//  Created by Stijn Mathysen on 13/04/17.
//  Copyright © 2017 Stijn Mathysen. All rights reserved.
//

#import <Foundation/Foundation.h>

static const NSInteger SLValidador_TAM_NIF = 9;
static const NSInteger SLValidador_NIF_ERROR = -1;
static const NSInteger SLValidador_NIF_ERROR_TAMANO = -2;
static const NSInteger SLValidador_NIF_ERROR_BLANCOS = -3;
static const NSInteger SLValidador_NIF_ERROR_CARACTERES = -4;
static const NSInteger SLValidador_NIF_ERROR_3LETRAS = -5;
static const NSInteger SLValidador_NIF_ERROR_DATOSENTRADA = -6;
static const NSInteger SLValidador_CIF_ERROR_DC = -10;
static const NSInteger SLValidador_NIF_ERROR_DC = -11;
static const NSInteger SLValidador_NIF_ERROR_NUM = -12;
static const NSInteger SLValidador_NIF_ERROR_DOSNUM = -13;
static const NSInteger SLValidador_DNI_ERROR_MAX = -20;
static const NSInteger SLValidador_DNI_ERROR_VALOR = -21;
static const NSInteger SLValidador_DNI_OK = 0;
static const NSInteger SLValidador_NIF_OK = 1;
static const NSInteger SLValidador_NIF_NORESIDENTES = 2;
static const NSInteger SLValidador_NIF_MENORES14ANOS = 3;
static const NSInteger SLValidador_NIF_EXTRANJEROS = 4;
static const NSInteger SLValidador_CIF_OK = 20;
static const NSInteger SLValidador_CIF_EXTRANJERO_OK = 21;
static const NSInteger SLValidador_CIF_ORGANIZACION_OK = 22;
static const NSInteger SLValidador_CIF_NORESIDENTES_OK = 23;

@interface SLValidador : NSObject

-(NSInteger)checkNif:(NSString *)number;
-(BOOL)carac:(char)var2 EnCad:(char[])var1;
-(NSInteger)vNif:(NSString *)var1;

@end
