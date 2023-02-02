/*** 
Vinícius Roriz Meireles Silva - 190020814 

***/

%{
    int tritongo = 0;
    int ditongo = 0;
    int palavra = 0;
    int vogais_seguidas = 0;
    int aux = 0;
%}
%%
[AEIOUaeiou]            {   vogais_seguidas++;}
[A-Za-z]{-}[AEIOUaeiou] {   if(vogais_seguidas == 3){
                                if(aux == 1){
                                    ditongo--;
                                    tritongo++;
                                } else if(aux == 0){
                                    aux = 2;
                                    tritongo++;
                                }
                            } 
                            else if (vogais_seguidas == 2){
                                if(aux == 0){
                                    aux = 1;
                                    ditongo++;
                                }
                            }
                            vogais_seguidas = 0;}
[ \n\t\r]+              {   if(vogais_seguidas == 3){
                                if(aux == 1){
                                    ditongo--;
                                    tritongo++;
                                } else if(aux == 0){
                                    tritongo++;
                                }
                            } 
                            else if (vogais_seguidas == 2){
                                if(aux == 0) ditongo++;
                            }
                            palavra++;
                            aux = 0;
                            vogais_seguidas = 0;}
<<EOF>>                 {   if(vogais_seguidas == 3){
                                if(aux == 1){
                                    ditongo--;
                                    tritongo++;
                                } else if(aux == 0){
                                    tritongo++;
                                }
                            }  
                            else if (vogais_seguidas == 2){
                                if(aux == 0) ditongo++;
                            }
                            palavra++;
                            return 0;}
%%

int yywrap(){}
int main(){
    yylex();
    printf("%d %d %d\n", tritongo, ditongo, palavra);
    return 0;
}