/*** run: flex lex.l && gcc -o a lex.yy.c ***/

/*** Definitions ***/

%{
    int tritongo = 0;
    int ditongo = 0;
    int palavra = 0;
    int vogais_seguidas = 0;
    int aux = 0;
%}

/*** Rules ***/

%%
[AEIOUaeiou]            {   
                            vogais_seguidas++;
                        }
[A-Za-z]{-}[AEIOUaeiou] {   
                            if(vogais_seguidas == 3){
                                if(aux){
                                    ditongo--;
                                    tritongo++;
                                } else{
                                    aux = 1;
                                    tritongo++;
                                    //printf("tritongo = %d\n",tritongo);
                                }
                            } 
                            else if (vogais_seguidas == 2){
                                if(!aux){
                                    aux = 1;
                                    ditongo++;
                                    //printf("ditongo = %d\n", ditongo);
                                }
                            }
                            vogais_seguidas = 0;
                        }
[ \n\t\r]+              {
                            if(vogais_seguidas == 3){
                                if(aux){
                                    ditongo--;
                                    tritongo++;
                                } else{
                                    tritongo++;
                                    //printf("tritongo = %d\n",tritongo);
                                }
                            } 
                            else if (vogais_seguidas == 2){
                                if(!aux){
                                    ditongo++;
                                    //printf("ditongo = %d\n", ditongo);
                                }
                            }
                            palavra++;
                            aux = 0;
                            //printf("palavras = %d\n", palavra);
                            vogais_seguidas = 0;
                        }
<<EOF>>                 {   
                            if(vogais_seguidas == 3){
                                if(aux){
                                    ditongo--;
                                    tritongo++;
                                } else{
                                    aux = 1;
                                    tritongo++;
                                    //printf("tritongo = %d\n",tritongo);
                                }
                            }  
                            else if (vogais_seguidas == 2){
                                if(!aux){
                                    ditongo++;
                                    //printf("ditongo = %d\n", ditongo);
                                }
                            }
                            palavra++;
                            //printf("palavras = %d\n", palavra);
                            return 0;
                        }
%%

// User code

int yywrap(){}
int main(){
    yylex();
    printf("\ntritongo - %d", tritongo);
    printf("\nditongo - %d", ditongo);
    printf("\npalavras - %d\n", palavra);
  
    return 0;
}
