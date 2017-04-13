//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.aeat.valida;

public class Validador {
    public static final int TAM_NIF = 9;
    public static final int NIF_ERROR = -1;
    public static final int NIF_ERROR_TAMANO = -2;
    public static final int NIF_ERROR_BLANCOS = -3;
    public static final int NIF_ERROR_CARACTERES = -4;
    public static final int NIF_ERROR_3LETRAS = -5;
    public static final int NIF_ERROR_DATOSENTRADA = -6;
    public static final int CIF_ERROR_DC = -10;
    public static final int NIF_ERROR_DC = -11;
    public static final int NIF_ERROR_NUM = -12;
    public static final int NIF_ERROR_DOSNUM = -13;
    public static final int DNI_ERROR_MAX = -20;
    public static final int DNI_ERROR_VALOR = -21;
    public static final int DNI_OK = 0;
    public static final int NIF_OK = 1;
    public static final int NIF_NORESIDENTES = 2;
    public static final int NIF_MENORES14ANOS = 3;
    public static final int NIF_EXTRANJEROS = 4;
    public static final int CIF_OK = 20;
    public static final int CIF_EXTRANJERO_OK = 21;
    public static final int CIF_ORGANIZACION_OK = 22;
    public static final int CIF_NORESIDENTES_OK = 23;
    private static final char[] Numeros = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    private static final char[] Letras = new char[]{'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'X', 'Y', 'Z'};
    private static final char[] LetrasNIF = new char[]{'T', 'R', 'W', 'A', 'G', 'M', 'Y', 'F', 'P', 'D', 'X', 'B', 'N', 'J', 'Z', 'S', 'Q', 'V', 'H', 'L', 'C', 'K', 'E'};
    private static final char[] Letras2CIF = new char[]{'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'};
    private static final char[] LetrasCIF = new char[]{'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'U', 'V'};
    public static final char[] LetrasCIFORG_Y_EXTR = new char[]{'A', 'B', 'C', 'D', 'E', 'F', 'G', 'P', 'Q', 'S', 'N', 'W', 'R'};
    private static final char[] LetrasREGATRIBRENTAS = new char[]{'E', 'G', 'H', 'J', 'U', 'V'};
    private static final char[] LetrasCIFEXT = new char[]{'A', 'B', 'C', 'D', 'E', 'F', 'G', 'N', 'W'};
    private static final char[] LetrasNIFEXT = new char[]{'X', 'Y', 'Z'};

    public Validador() {
    }

    public int checkNif(String var1) {
        return var1 != null && var1.length() == 9?this.vNif(var1):-1;
    }

    public int vNif(String var1) {
        String var2 = null;
        boolean var4 = false;
        int var5 = 0;
        long var6 = 0L;
        long var8 = 0L;
        var1 = var1.trim();
        if(var1.length() != 9) {
            return -2;
        } else {
            char var10 = 0;
            char var11 = 0;
            int var12 = 0;
            int var13 = 0;
            int var14 = 0;
            char[] var15 = var1.toCharArray();

            int var3;
            for(var3 = 0; var3 < 9; ++var3) {
                char var16 = var15[var3];
                int var17 = Character.getType(var16);
                if(var17 == 1 && var12 == 0) {
                    ++var12;
                    var10 = var16;
                    var13 = var3;
                } else if(var17 == 1 && var12 == 1) {
                    ++var12;
                    var11 = var16;
                    var14 = var3;
                } else {
                    if(var17 == 1 && var12 == 2) {
                        return -5;
                    }

                    if(var17 != 9) {
                        return -4;
                    }
                }
            }

            if(var12 == 0) {
                if(var15[0] != 48) {
                    return -20;
                } else {
                    String var20 = var1.substring(1);
                    if(!var20.equals("11111111") && !var20.equals("22222222") && !var20.equals("33333333") && !var20.equals("44444444") && !var20.equals("55555555") && !var20.equals("66666666") && !var20.equals("77777777") && !var20.equals("88888888") && !var20.equals("99999999") && !var20.equals("00000000")) {
                        return 0;
                    } else {
                        return -21;
                    }
                }
            } else {
                int var19;
                if(var12 == 1 && this.caracEnCad(LetrasCIF, var15[var13]) && var13 == 0 && Character.isDigit(var15[8])) {
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
                        if(this.caracEnCad(LetrasREGATRIBRENTAS, var15[var13])) {
                            return 23;
                        } else {
                            return 20;
                        }
                    } else {
                        return -10;
                    }
                } else if(var12 == 2 && this.caracEnCad(LetrasCIFORG_Y_EXTR, var15[var13]) && var13 == 0 && var14 == 8 && this.caracEnCad(Letras2CIF, var15[var14])) {
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
                        if(this.caracEnCad(LetrasCIFEXT, var15[var13])) {
                            return 21;
                        } else {
                            return 22;
                        }
                    } else {
                        return -10;
                    }
                } else if(var12 == 1 && this.caracEnCad(Letras, var15[8]) && this.caracEnCad(LetrasNIF, var15[var13]) && var13 == 8) {
                    StringBuffer var18 = new StringBuffer(var1.substring(0, var13));
                    var6 = Long.parseLong(var18.toString());
                    var8 = var6 % 23L;
                    if(var8 + 1L > 23L) {
                        return -12;
                    } else if(var10 == LetrasNIF[(int)var8]) {
                        if(!var1.equals("00000001R") && !var1.equals("00000000T") && !var1.equals("99999999R")) {
                            return 1;
                        } else {
                            return -1;
                        }
                    } else {
                        return -11;
                    }
                } else if(var12 == 2 && (var15[0] == 75 || var15[0] == 76 || var15[0] == 77) && this.caracEnCad(LetrasNIF, var15[var14]) && var14 == 8) {
                    var2 = var1.substring(1, 3);
                    if(this.caracEnCad(Numeros, var2.charAt(0)) && this.caracEnCad(Numeros, var2.charAt(1))) {
                        var3 = Integer.parseInt(var2);
                        if(var3 >= 1 && var3 <= 56) {
                            var2 = var1.substring(1, var14);
                            var6 = Long.parseLong(var2);
                            var8 = var6 % 23L;
                            ++var8;
                            if(var8 > 23L) {
                                return -12;
                            } else if(var11 == LetrasNIF[(int)(var8 - 1L)]) {
                                return 2;
                            } else {
                                return -11;
                            }
                        } else {
                            return -1;
                        }
                    } else {
                        return -13;
                    }
                } else if(var1.equals("X0000000T")) {
                    return -1;
                } else if(var12 == 2 && this.caracEnCad(LetrasNIFEXT, var15[0]) && this.caracEnCad(LetrasNIF, var15[var14]) && var14 == 8) {
                    var2 = var1.substring(1, var14);
                    var6 = Long.parseLong(var2);
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

    private boolean caracEnCad(char[] var1, char var2) {
        boolean var3 = false;
        int var4 = var1.length;

        for(int var5 = 0; var5 < var4; ++var5) {
            if(var1[var5] == var2) {
                var3 = true;
                break;
            }
        }

        return var3;
    }
}