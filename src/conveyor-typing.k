require "conveyor-syntax.k"

module CONVEYOR-TYPING-SYNTAX
    imports CONVEYOR-SYNTAX
endmodule

module CONVEYOR-TYPING
    imports CONVEYOR-SYNTAX
    imports DOMAINS

    syntax KResult ::= Type | Qualifier

    configuration <T>
                    <k> $PGM:Program </k>
                    <typeEnv> .Map </typeEnv>
                    <typeVars> .Set </typeVars>
                  </T>
    syntax Term ::= unify(Term, Term) [strict]
                  | setTEnv(Map)
                  | setTVars(Set)
                  | Type

    rule B:Bool => bool
    rule I:Int => int

    rule Q1:Qualifier (Q2:Qualifier T:Type) => (Q1 ^ Q2) T
endmodule

