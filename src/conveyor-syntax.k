require "../Chassis/src/chassis-syntax.k"

module CONVEYOR-SYNTAX
    imports CHASSIS-SYNTAX

    syntax BaseQualifier ::= "un" | "lin" | "ord" | "rel" | "aff" | "rc"
    syntax Qualifier     ::= BaseQualifier
                           | Qualifier "^" Qualifier [left, strict]

    syntax Term ::= Qualifier Term [strict]
    syntax Type ::= Qualifier Type [strict]

    syntax Bool ::= BaseQualifier "<=" BaseQualifier [function, functional]
endmodule

