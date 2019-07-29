require "../Chassis/src/chassis-syntax.k"

module CONVEYOR-SYNTAX
    imports CHASSIS-SYNTAX

    syntax Qualifier ::= "un" | "lin" | "ord" | "rel" | "aff" | "rc"
    syntax Term ::= Qualifier Term [strict]
                  | Qualifier "^" Qualifier [left, strict]
    syntax Type ::= Qualifier Type [strict]

    syntax Bool ::= Qualifier "<=" Qualifier [function, functional]

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
endmodule

