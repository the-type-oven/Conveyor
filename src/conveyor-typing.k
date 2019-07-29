require "conveyor-syntax.k"

module CONVEYOR-TYPING-SYNTAX
    imports CONVEYOR-SYNTAX
endmodule

module CONVEYOR-TYPING
    imports CONVEYOR-SYNTAX
    imports DOMAINS

    syntax KResult ::= Type | BaseQualifier

    configuration <T>
                    <k> $PGM:Program </k>
                    <typeEnv> .Map </typeEnv>
                    <typeVars> .Set </typeVars>
                  </T>
    syntax Term ::= unify(Term, Term) [strict]
                  | setTEnv(Map)
                  | setTVars(Set)
                  | Type

    // TODO: This is kinda ugly
    rule X   <= un  => true
    rule ord <= X   => true
    rule lin <= aff => true
    rule lin <= rel => true
    rule rc  <= lin => true
    rule lin <= ord => false
    rule aff <= lin => false
    rule rel <= lin => false
    rule un  <= rel => false
    rule un  <= ord => false
    rule un  <= aff => false
    rule un  <= lin => false
    rule un  <= rc  => false

    rule X ^ Y => X requires X <= Y
    rule X ^ Y => Y requires Y <= X

    rule B:Bool => bool
    rule I:Int  => int

    rule Q1:BaseQualifier (Q2:BaseQualifier T:Type) => (Q1 ^ Q2) T
endmodule

