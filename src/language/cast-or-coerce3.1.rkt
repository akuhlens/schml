#lang typed/racket/base
(require "forms.rkt")

(provide (all-defined-out)
         (all-from-out "forms.rkt"))

#|------------------------------------------------------------------------------
Cast-or-Coerce3.1-Lang is the product of hoist-types
------------------------------------------------------------------------------|#

(define-type Cast-or-Coerce3.1-Lang
  (Prog (List String Natural Schml-Type)
        (Let-Static* CoC3.1-Bnd-Type*
                     CoC3.1-Bnd-Crcn*
                     CoC3.1-Expr)))

(define-type CoC3.1-Expr
  (Rec E (U ;; Code Labels
          (Code-Label Uid)
          (Labels CoC3.1-Bnd-Code* E)
          (App-Code E (Listof E))
          ;; Functions as an interface
          (Lambda Uid* (Castable (Option Uid) E))
          (Fn-Caster E)
          (App-Fn E (Listof E))
          ;; Our Lovely Function Proxy Representation
          (App-Fn-or-Proxy Uid E (Listof E))
          (Fn-Proxy (List Index Uid) E E)
          (Fn-Proxy-Huh E)
          (Fn-Proxy-Closure E)
          (Fn-Proxy-Coercion E)
          ;; Coercions
          (Quote-Coercion Immediate-Coercion)
          (Compose-Coercions E E)
          (Id-Coercion-Huh E)
          (Fn-Coercion-Huh E)
          (Make-Fn-Coercion Uid E E E)
          (Compose-Fn-Coercion Uid E E)
          (Fn-Coercion (Listof E) E)
          (Fn-Coercion-Arg E E)
          (Fn-Coercion-Return E)
          (Ref-Coercion E E)
          (Ref-Coercion-Huh E)
          (Ref-Coercion-Read E)
          (Ref-Coercion-Write E)
          (Sequence-Coercion E E)
          (Sequence-Coercion-Huh E)
          (Sequence-Coercion-Fst E)
          (Sequence-Coercion-Snd E)
          (Project-Coercion E E)
          (Project-Coercion-Huh E)
          (Project-Coercion-Type E)
          (Project-Coercion-Label E)
          (Inject-Coercion E)
          (Inject-Coercion-Type E)
          (Inject-Coercion-Huh E)
          (Failed-Coercion E)
          (Failed-Coercion-Huh E)
          (Failed-Coercion-Label E)
          ;;Type operations
          (Type Prim-Type)
          (Type-Dyn-Huh E)
          (Type-Fn-Huh E)
          (Type-Fn-arity E)
          (Type-Fn-arg E E)
          (Type-Fn-return E)
          (Type-GRef-Huh E)
          (Type-GRef-Of  E)
          (Type-GVect-Huh E)
          (Type-GVect-Of E)
          ;; Tags are exposed before specify This is bad
          ;; TODO fix this after the deadline
          (Type-Tag E)
          (Tag Tag-Symbol)
          ;;(Type-Ctr-Case E Type-Ctr-Case-Clause* E)
          ;;(Dyn-Case E Type-Ctr-Clause* E)
          ;; Dynamic as a value
          (Dyn-tag E)
          (Dyn-immediate E)
          (Dyn-type E)
          (Dyn-value E)
          (Dyn-make E E)
          ;; Binding Forms - Lambda
	  (Letrec CoC3.1-Bnd* E)
	  (Let CoC3.1-Bnd* E)
          (Var Uid)
          ;; Controll Flow
          (If E E E)
          (Begin CoC3.1-Expr* E)
          (Repeat Uid E E E)
          ;;Primitives
          (Op Schml-Primitive (Listof E))
          (Quote Cast-Literal)
          ;; Casts with different ways of getting the same semantics
	  ;;(Cast E (Twosome Schml-Type Schml-Type Blame-Label))
          ;;(Cast E (Coercion Schml-Coercion))
          ;;(Interpreted-Cast E (Twosome E E E))
          ;;(Interpreted-Cast E (Coercion E))
          ;; Observations
          (Blame E)
          (Observe E Schml-Type)
          ;; Unguarded-Representation
          (Unguarded-Box E)
          (Unguarded-Box-Ref E)
          (Unguarded-Box-Set! E E)
          (Unguarded-Vect E E)
          (Unguarded-Vect-Ref E E)
          (Unguarded-Vect-Set! E E E)
          (Guarded-Proxy-Huh E)
          (Guarded-Proxy E (Twosome E E E))
          (Guarded-Proxy E (Coercion E))
          (Guarded-Proxy-Ref E)
          (Guarded-Proxy-Source E)
          (Guarded-Proxy-Target E)
          (Guarded-Proxy-Blames E)
          (Guarded-Proxy-Coercion E)
          ;;
          (Create-tuple (Listof E))
          (Tuple-proj E Index)
          (Tuple-Coercion-Huh E)
          (Tuple-Coercion-Num E)
          (Tuple-Coercion-Item E Index)
          (Coerce-Tuple Uid E E)
          (Cast-Tuple Uid E E E E)
          (Type-Tuple-Huh E)
          (Type-Tuple-num E)
          (Type-Tuple-item E Index)
          (Make-Tuple-Coercion Uid E E E)
          (Compose-Tuple-Coercion Uid E E)
          (Mediating-Coercion-Huh? E))))

(define-type CoC3.1-Code (Code Uid* CoC3.1-Expr))
(define-type CoC3.1-Expr* (Listof CoC3.1-Expr))
(define-type CoC3.1-Bnd (Pairof Uid CoC3.1-Expr))
(define-type CoC3.1-Bnd* (Listof CoC3.1-Bnd))
(define-type CoC3.1-Bnd-Code (Pairof Uid CoC3.1-Code))
(define-type CoC3.1-Bnd-Code* (Listof CoC3.1-Bnd-Code))
(define-type CoC3.1-Bnd-Type (Pairof Uid Compact-Type))
(define-type CoC3.1-Bnd-Type* (Listof CoC3.1-Bnd-Type))
(define-type CoC3.1-Bnd-Crcn (Pairof Uid Compact-Coercion))
(define-type CoC3.1-Bnd-Crcn* (Listof CoC3.1-Bnd-Crcn))