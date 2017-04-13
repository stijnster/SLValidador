//
//  SLValidador.m
//  SLValidador
//
//  Created by Stijn Mathysen on 13/04/17.
//  Copyright © 2017 Stijn Mathysen. All rights reserved.
//

#import "SLValidador.h"

@implementation SLValidador

char Numeros[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
char Letras[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'X', 'Y', 'Z'};
char LetrasNIF[] = {'T', 'R', 'W', 'A', 'G', 'M', 'Y', 'F', 'P', 'D', 'X', 'B', 'N', 'J', 'Z', 'S', 'Q', 'V', 'H', 'L', 'C', 'K', 'E'};
char Letras2CIF[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'};
char LetrasCIF[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'U', 'V'};
char LetrasCIFORG_Y_EXTR[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'P', 'Q', 'S', 'N', 'W', 'R'};
char LetrasREGATRIBRENTAS[] = {'E', 'G', 'H', 'J', 'U', 'V'};
char LetrasCIFEXT[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'N', 'W'};
char LetrasNIFEXT[] = {'X', 'Y', 'Z'};

-(NSInteger)checkNif:(NSString *)number{
    return (number != NULL) && ([number length] == 9) ? [self vNif:number] : SLValidador_NIF_ERROR;
}

-(BOOL)carac:(char)var2 EnCad:(char[])var1{
    BOOL var3 = false;
    unsigned long var4 = strlen(var1);

    for(int var5 = 0; var5 < var4; ++var5) {
        if(var1[var5] == var2) {
            var3 = true;
            break;
        }
    }
    
    return var3;
}

-(NSInteger)vNif:(NSString *)var1{
    NSString *var2 = NULL;
    BOOL var4 = false;
    int var5 = 0;
    long var6 = 0L;
    long var8 = 0L;
    
    var1 = [var1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([var1 length] != 9) {
        return SLValidador_NIF_ERROR_TAMANO;
    } else {
        char var10 = 0;
        char var11 = 0;
        int var12 = 0;
        int var13 = 0;
        int var14 = 0;
        char var15[9];
        
        for(int i = 0; i < 9; i++){
            var15[i] = [var1 characterAtIndex:i];
        }

        int var3;
        for(var3 = 0; var3 < 9; ++var3) {
            char var16 = var15[var3];
            if(isupper(var16) && var12 == 0) {
                ++var12;
                var10 = var16;
                var13 = var3;
            } else if(isupper(var16) && var12 == 1) {
                ++var12;
                var11 = var16;
                var14 = var3;
            } else {
                if(isupper(var16) && var12 == 2) {
                    return SLValidador_NIF_ERROR_3LETRAS;
                }

                if(!isdigit(var16)){
                    return SLValidador_NIF_ERROR_CARACTERES;
                }
            }
        }

        if(var12 == 0) {
            if(var15[0] != 48) {
                return SLValidador_DNI_ERROR_MAX;
            } else {
                NSString *var20 = [var1 substringFromIndex:1];

                if(![var20 isEqualToString:@"11111111"] && ![var20 isEqualToString:@"22222222"] && ![var20 isEqualToString:@"33333333"] && ![var20 isEqualToString:@"44444444"] && ![var20 isEqualToString:@"55555555"] && ![var20 isEqualToString:@"66666666"] && ![var20 isEqualToString:@"77777777"] && ![var20 isEqualToString:@"88888888"] && ![var20 isEqualToString:@"99999999"] && ![var20 isEqualToString:@"00000000"]) {
                    return SLValidador_DNI_OK;
                } else {
                    return SLValidador_CIF_EXTRANJERO_OK;
                }
            }
        } else {
            int var19;
            if((var12 == 1) && [self carac:var15[var13] EnCad:LetrasCIF] && (var13 == 0) && isdigit(var15[8])) {
                for(var3 = 1; var3 < 8; ++var3) {
                    if(var3 != 2 && var3 != 4 && var3 != 6) {
                        var19 = (var15[var3] - 48) * 2;
                        if(var19 > 9) {
                            var19 -= 9;
                        }

                        var5 += var19;
                    } else {
                        var5 += var15[var3] - 48;
                    }
                }

                var5 = 10 - var5 % 10;
                if(var5 == 10) {
                    var5 = 0;
                }

                if(var5 == var15[var3] - 48) {
                    if([self carac:var15[var13] EnCad:LetrasREGATRIBRENTAS]){
                        return SLValidador_CIF_NORESIDENTES_OK;
                    } else {
                        return SLValidador_CIF_OK;
                    }
                } else {
                    return SLValidador_CIF_ERROR_DC;
                }
            } else if(var12 == 2 && [self carac:var15[var13] EnCad:LetrasCIFORG_Y_EXTR] && (var13 == 0) && (var14 == 8) && [self carac:var15[var14] EnCad:Letras2CIF]) {
                for(var3 = 1; var3 < 8; ++var3) {
                    if(var3 != 2 && var3 != 4 && var3 != 6) {
                        var19 = (var15[var3] - 48) * 2;
                        if(var19 > 9) {
                            var19 -= 9;
                        }

                        var5 += var19;
                    } else {
                        var5 += var15[var3] - 48;
                    }
                }

                var5 = 10 - var5 % 10;
                if(Letras2CIF[var5 - 1] == var15[var14]) {
                    if([self carac:var15[var13] EnCad:LetrasCIFEXT]) {
                        return SLValidador_CIF_EXTRANJERO_OK;
                    } else {
                        return SLValidador_CIF_ORGANIZACION_OK;
                    }
                } else {
                    return SLValidador_CIF_ERROR_DC;
                }
            } else if((var12 == 1) && [self carac:var15[8] EnCad:Letras] && [self carac:var15[var13] EnCad:LetrasNIF] && (var13 == 8)) {
                NSString *var18 = [var1 substringWithRange:NSMakeRange(0, var13)];

                var6 = [var18 longLongValue];
                var8 = var6 % 23L;
                if(var8 + 1L > 23L) {
                    return SLValidador_NIF_ERROR_NUM;
                } else if(var10 == LetrasNIF[(int)var8]) {
                    if(![var1 isEqualToString:@"00000001R"] && ![var1 isEqualToString:@"00000000T"] && ![var1 isEqualToString:@"99999999R"]){
                        return SLValidador_NIF_OK;
                    } else {
                        return SLValidador_NIF_ERROR;
                    }
                } else {
                    return SLValidador_NIF_ERROR_DC;
                }
            } else if((var12 == 2) && ((var15[0] == 75) || (var15[0] == 76) || (var15[0] == 77)) && [self carac:var15[var14] EnCad:LetrasNIF] && (var14 == 8)) {
                var2 = [var1 substringWithRange:NSMakeRange(1, 3)];
                if([self carac:[var2 characterAtIndex:0] EnCad:Numeros] && [self carac:[var2 characterAtIndex:1] EnCad:Numeros]) {
                    var3 = [var2 intValue];
                    if((var3 >= 1) && (var3 <= 56)) {
                        var2 = [var1 substringWithRange:NSMakeRange(1, var14)];
                        var6 = [var2 longLongValue];
                        var8 = var6 % 23L;
                        ++var8;
                        if(var8 > 23L) {
                            return SLValidador_NIF_ERROR_NUM;
                        } else if(var11 == LetrasNIF[(int)(var8 - 1L)]) {
                            return SLValidador_NIF_NORESIDENTES;
                        } else {
                            return SLValidador_NIF_ERROR_DC;
                        }
                    } else {
                        return SLValidador_NIF_ERROR;
                    }
                } else {
                    return SLValidador_NIF_ERROR_DOSNUM;
                }
            } else if([var1 isEqualToString:@"X0000000T"]) {
                return SLValidador_NIF_ERROR;
            } else if(var12 == 2 && [self carac:var15[0] EnCad:LetrasNIFEXT] && [self carac:var15[var14] EnCad:LetrasNIF] && (var14 == 8)) {
                var2 = [var1 substringWithRange:NSMakeRange(1, var14)];
                var6 = [var2 longLongValue];
                if(var15[0] == 89) {
                    var6 += 10000000L;
                } else if(var15[0] == 90) {
                    var6 += 20000000L;
                }
                
                var8 = var6 % 23L;
                ++var8;
                if(var8 > 23L) {
                    return -12;
                } else if(var11 == LetrasNIF[(int)(var8 - 1L)]) {
                    return 4;
                } else {
                    return -11;
                }
            } else {
                return -1;
            }
        }
    }
}

@end