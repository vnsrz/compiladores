#include <iostream>
#include <variant>
#include <string>

using namespace std;
using token = char;

using token_t = pair <int, variant<int, string>>;
const int num=256, ID=257;

token_t next_token(){
    while(not cin.eof())
    {
        auto c = cin.get();
        int v = c-'0';

        if(isdigit(c)){
            while(not cin.eof() and (c=cin.get(), isdigit(c))){
                v= 10*v+(c-'0');
            }
            cin.unget();
            return{num,v};
        }else if(c=='_' or isalpha(c))
                {
                    string lexema;
                    lexema += c;

                        while(not cin.eof() and (c=cin.get(), c=='_' or isalnum(c)))
                        {
                            lexema+=c;
                        }
                        cin.unget();
                        return{ID,lexema};
                }else 
                return{c,NULL};
    }
    return{EOF,NULL};
}

token proximo_token(){
    auto t = cin.get();
    return (token) t;
}

token lookahead;

void erro(){
    cerr << "\nErro de sintaxe! lookahead = " << lookahead << '\n';
    exit(-1);
}

void reconhecer(token t){
    if(lookahead == t) lookahead = proximo_token();
    else erro();
}

void digito(){
    if(isdigit(lookahead)){
        cout.put(lookahead);
        reconhecer(lookahead);
    }else erro();
}

void resto(){
    if (lookahead == '+' or lookahead == '-'){
        auto c = lookahead;
        reconhecer(c);
        digito();
        cout.put(c);
        resto();
    }
}

void expr(){
    digito();
    resto();
}

int main(){
    lookahead = proximo_token();
    expr();
    cout.put('\n');
    return 0;
}