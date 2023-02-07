/***
Vinicius Roriz Meireles Silva   - 190020814
Caio Santos                     - 170007413
***/

%{
    int tritongo = 0; int ditongo = 0; int palavra = 0; int vogais_seguidas = 0; int aux = 0; char lr = 'n';
%}

%%
[AEIOUaeiou]    {   vogais_seguidas++; lr = 'l';}
[A-Za-z]        {   if(vogais_seguidas >= 3){
                        if(aux == 1){
                            ditongo--;
                            tritongo++;
                        } else if(aux == 0){
                            aux = 2;
                            tritongo++;
                        }
                    } else if (vogais_seguidas == 2 && aux == 0){
                        aux = 1;
                        ditongo++;
                    } vogais_seguidas = 0; lr = 'l';}
[ \n\t\r]+      {   if(vogais_seguidas >= 3){
                        if(aux == 1){
                            ditongo--;
                            tritongo++;
                        } else if(aux == 0){
                            tritongo++;
                        }
                    } else if (vogais_seguidas == 2 && aux == 0) ditongo++;
                    if(lr != 'n') palavra++; aux = 0; vogais_seguidas = 0; lr = 'n';}
<<EOF>>         {   if(vogais_seguidas >= 3){
                        if(aux == 1){
                            ditongo--;
                            tritongo++;
                        } else if(aux == 0){
                            tritongo++;
                        }
                    } else if (vogais_seguidas == 2 && aux == 0) ditongo++;
                    if(lr == 'l') palavra++; 
                    return 0;}
%%

int yywrap(){}
int main(){
    yylex();
    printf("%d %d %d\n", tritongo, ditongo, palavra);
    return 0;}