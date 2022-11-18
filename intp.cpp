#include <iostream>

using namespace std;
using token = char;

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