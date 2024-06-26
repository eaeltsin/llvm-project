; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mattr=+sve -force-streaming-compatible  < %s | FileCheck %s --check-prefixes=CHECK,SVE
; RUN: llc -mattr=+sve2 -force-streaming-compatible  < %s | FileCheck %s --check-prefixes=CHECK,SVE2
; RUN: llc -mattr=+sme -force-streaming-compatible  < %s | FileCheck %s --check-prefixes=CHECK,SVE2

target triple = "aarch64-unknown-linux-gnu"

;
; ADD
;
define <4 x i8> @add_v4i8(<4 x i8> %op1, <4 x i8> %op2) {
; CHECK-LABEL: add_v4i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $z0
; CHECK-NEXT:    // kill: def $d1 killed $d1 def $z1
; CHECK-NEXT:    add z0.h, z0.h, z1.h
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $z0
; CHECK-NEXT:    ret
  %res = add <4 x i8> %op1, %op2
  ret <4 x i8> %res
}

define <8 x i8> @add_v8i8(<8 x i8> %op1, <8 x i8> %op2) {
; CHECK-LABEL: add_v8i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $z0
; CHECK-NEXT:    // kill: def $d1 killed $d1 def $z1
; CHECK-NEXT:    add z0.b, z0.b, z1.b
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $z0
; CHECK-NEXT:    ret
  %res = add <8 x i8> %op1, %op2
  ret <8 x i8> %res
}

define <16 x i8> @add_v16i8(<16 x i8> %op1, <16 x i8> %op2) {
; CHECK-LABEL: add_v16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $q0 killed $q0 def $z0
; CHECK-NEXT:    // kill: def $q1 killed $q1 def $z1
; CHECK-NEXT:    add z0.b, z0.b, z1.b
; CHECK-NEXT:    // kill: def $q0 killed $q0 killed $z0
; CHECK-NEXT:    ret
  %res = add <16 x i8> %op1, %op2
  ret <16 x i8> %res
}

define void @add_v32i8(ptr %a, ptr %b) {
; CHECK-LABEL: add_v32i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp q0, q3, [x1]
; CHECK-NEXT:    ldp q1, q2, [x0]
; CHECK-NEXT:    add z0.b, z1.b, z0.b
; CHECK-NEXT:    add z1.b, z2.b, z3.b
; CHECK-NEXT:    stp q0, q1, [x0]
; CHECK-NEXT:    ret
  %op1 = load <32 x i8>, ptr %a
  %op2 = load <32 x i8>, ptr %b
  %res = add <32 x i8> %op1, %op2
  store <32 x i8> %res, ptr %a
  ret void
}

define <2 x i16> @add_v2i16(<2 x i16> %op1, <2 x i16> %op2) {
; CHECK-LABEL: add_v2i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $z0
; CHECK-NEXT:    // kill: def $d1 killed $d1 def $z1
; CHECK-NEXT:    add z0.s, z0.s, z1.s
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $z0
; CHECK-NEXT:    ret
  %res = add <2 x i16> %op1, %op2
  ret <2 x i16> %res
}

define <4 x i16> @add_v4i16(<4 x i16> %op1, <4 x i16> %op2) {
; CHECK-LABEL: add_v4i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $z0
; CHECK-NEXT:    // kill: def $d1 killed $d1 def $z1
; CHECK-NEXT:    add z0.h, z0.h, z1.h
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $z0
; CHECK-NEXT:    ret
  %res = add <4 x i16> %op1, %op2
  ret <4 x i16> %res
}

define <8 x i16> @add_v8i16(<8 x i16> %op1, <8 x i16> %op2) {
; CHECK-LABEL: add_v8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $q0 killed $q0 def $z0
; CHECK-NEXT:    // kill: def $q1 killed $q1 def $z1
; CHECK-NEXT:    add z0.h, z0.h, z1.h
; CHECK-NEXT:    // kill: def $q0 killed $q0 killed $z0
; CHECK-NEXT:    ret
  %res = add <8 x i16> %op1, %op2
  ret <8 x i16> %res
}

define void @add_v16i16(ptr %a, ptr %b) {
; CHECK-LABEL: add_v16i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp q0, q3, [x1]
; CHECK-NEXT:    ldp q1, q2, [x0]
; CHECK-NEXT:    add z0.h, z1.h, z0.h
; CHECK-NEXT:    add z1.h, z2.h, z3.h
; CHECK-NEXT:    stp q0, q1, [x0]
; CHECK-NEXT:    ret
  %op1 = load <16 x i16>, ptr %a
  %op2 = load <16 x i16>, ptr %b
  %res = add <16 x i16> %op1, %op2
  store <16 x i16> %res, ptr %a
  ret void
}

define <2 x i32> @add_v2i32(<2 x i32> %op1, <2 x i32> %op2) {
; CHECK-LABEL: add_v2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $z0
; CHECK-NEXT:    // kill: def $d1 killed $d1 def $z1
; CHECK-NEXT:    add z0.s, z0.s, z1.s
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $z0
; CHECK-NEXT:    ret
  %res = add <2 x i32> %op1, %op2
  ret <2 x i32> %res
}

define <4 x i32> @add_v4i32(<4 x i32> %op1, <4 x i32> %op2) {
; CHECK-LABEL: add_v4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $q0 killed $q0 def $z0
; CHECK-NEXT:    // kill: def $q1 killed $q1 def $z1
; CHECK-NEXT:    add z0.s, z0.s, z1.s
; CHECK-NEXT:    // kill: def $q0 killed $q0 killed $z0
; CHECK-NEXT:    ret
  %res = add <4 x i32> %op1, %op2
  ret <4 x i32> %res
}

define void @add_v8i32(ptr %a, ptr %b) {
; CHECK-LABEL: add_v8i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp q0, q3, [x1]
; CHECK-NEXT:    ldp q1, q2, [x0]
; CHECK-NEXT:    add z0.s, z1.s, z0.s
; CHECK-NEXT:    add z1.s, z2.s, z3.s
; CHECK-NEXT:    stp q0, q1, [x0]
; CHECK-NEXT:    ret
  %op1 = load <8 x i32>, ptr %a
  %op2 = load <8 x i32>, ptr %b
  %res = add <8 x i32> %op1, %op2
  store <8 x i32> %res, ptr %a
  ret void
}

define <1 x i64> @add_v1i64(<1 x i64> %op1, <1 x i64> %op2) {
; CHECK-LABEL: add_v1i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $z0
; CHECK-NEXT:    // kill: def $d1 killed $d1 def $z1
; CHECK-NEXT:    add z0.d, z0.d, z1.d
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $z0
; CHECK-NEXT:    ret
  %res = add <1 x i64> %op1, %op2
  ret <1 x i64> %res
}

define <2 x i64> @add_v2i64(<2 x i64> %op1, <2 x i64> %op2) {
; CHECK-LABEL: add_v2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $q0 killed $q0 def $z0
; CHECK-NEXT:    // kill: def $q1 killed $q1 def $z1
; CHECK-NEXT:    add z0.d, z0.d, z1.d
; CHECK-NEXT:    // kill: def $q0 killed $q0 killed $z0
; CHECK-NEXT:    ret
  %res = add <2 x i64> %op1, %op2
  ret <2 x i64> %res
}

define void @add_v4i64(ptr %a, ptr %b) {
; CHECK-LABEL: add_v4i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp q0, q3, [x1]
; CHECK-NEXT:    ldp q1, q2, [x0]
; CHECK-NEXT:    add z0.d, z1.d, z0.d
; CHECK-NEXT:    add z1.d, z2.d, z3.d
; CHECK-NEXT:    stp q0, q1, [x0]
; CHECK-NEXT:    ret
  %op1 = load <4 x i64>, ptr %a
  %op2 = load <4 x i64>, ptr %b
  %res = add <4 x i64> %op1, %op2
  store <4 x i64> %res, ptr %a
  ret void
}

;
; MUL
;

define <4 x i8> @mul_v4i8(<4 x i8> %op1, <4 x i8> %op2) {
; SVE-LABEL: mul_v4i8:
; SVE:       // %bb.0:
; SVE-NEXT:    ptrue p0.h, vl4
; SVE-NEXT:    // kill: def $d0 killed $d0 def $z0
; SVE-NEXT:    // kill: def $d1 killed $d1 def $z1
; SVE-NEXT:    mul z0.h, p0/m, z0.h, z1.h
; SVE-NEXT:    // kill: def $d0 killed $d0 killed $z0
; SVE-NEXT:    ret
;
; SVE2-LABEL: mul_v4i8:
; SVE2:       // %bb.0:
; SVE2-NEXT:    // kill: def $d0 killed $d0 def $z0
; SVE2-NEXT:    // kill: def $d1 killed $d1 def $z1
; SVE2-NEXT:    mul z0.h, z0.h, z1.h
; SVE2-NEXT:    // kill: def $d0 killed $d0 killed $z0
; SVE2-NEXT:    ret
  %res = mul <4 x i8> %op1, %op2
  ret <4 x i8> %res
}

define <8 x i8> @mul_v8i8(<8 x i8> %op1, <8 x i8> %op2) {
; SVE-LABEL: mul_v8i8:
; SVE:       // %bb.0:
; SVE-NEXT:    ptrue p0.b, vl8
; SVE-NEXT:    // kill: def $d0 killed $d0 def $z0
; SVE-NEXT:    // kill: def $d1 killed $d1 def $z1
; SVE-NEXT:    mul z0.b, p0/m, z0.b, z1.b
; SVE-NEXT:    // kill: def $d0 killed $d0 killed $z0
; SVE-NEXT:    ret
;
; SVE2-LABEL: mul_v8i8:
; SVE2:       // %bb.0:
; SVE2-NEXT:    // kill: def $d0 killed $d0 def $z0
; SVE2-NEXT:    // kill: def $d1 killed $d1 def $z1
; SVE2-NEXT:    mul z0.b, z0.b, z1.b
; SVE2-NEXT:    // kill: def $d0 killed $d0 killed $z0
; SVE2-NEXT:    ret
  %res = mul <8 x i8> %op1, %op2
  ret <8 x i8> %res
}

define <16 x i8> @mul_v16i8(<16 x i8> %op1, <16 x i8> %op2) {
; SVE-LABEL: mul_v16i8:
; SVE:       // %bb.0:
; SVE-NEXT:    ptrue p0.b, vl16
; SVE-NEXT:    // kill: def $q0 killed $q0 def $z0
; SVE-NEXT:    // kill: def $q1 killed $q1 def $z1
; SVE-NEXT:    mul z0.b, p0/m, z0.b, z1.b
; SVE-NEXT:    // kill: def $q0 killed $q0 killed $z0
; SVE-NEXT:    ret
;
; SVE2-LABEL: mul_v16i8:
; SVE2:       // %bb.0:
; SVE2-NEXT:    // kill: def $q0 killed $q0 def $z0
; SVE2-NEXT:    // kill: def $q1 killed $q1 def $z1
; SVE2-NEXT:    mul z0.b, z0.b, z1.b
; SVE2-NEXT:    // kill: def $q0 killed $q0 killed $z0
; SVE2-NEXT:    ret
  %res = mul <16 x i8> %op1, %op2
  ret <16 x i8> %res
}

define void @mul_v32i8(ptr %a, ptr %b) {
; SVE-LABEL: mul_v32i8:
; SVE:       // %bb.0:
; SVE-NEXT:    ldp q0, q3, [x1]
; SVE-NEXT:    ptrue p0.b, vl16
; SVE-NEXT:    ldp q1, q2, [x0]
; SVE-NEXT:    mul z0.b, p0/m, z0.b, z1.b
; SVE-NEXT:    movprfx z1, z2
; SVE-NEXT:    mul z1.b, p0/m, z1.b, z3.b
; SVE-NEXT:    stp q0, q1, [x0]
; SVE-NEXT:    ret
;
; SVE2-LABEL: mul_v32i8:
; SVE2:       // %bb.0:
; SVE2-NEXT:    ldp q0, q3, [x1]
; SVE2-NEXT:    ldp q1, q2, [x0]
; SVE2-NEXT:    mul z0.b, z1.b, z0.b
; SVE2-NEXT:    mul z1.b, z2.b, z3.b
; SVE2-NEXT:    stp q0, q1, [x0]
; SVE2-NEXT:    ret
  %op1 = load <32 x i8>, ptr %a
  %op2 = load <32 x i8>, ptr %b
  %res = mul <32 x i8> %op1, %op2
  store <32 x i8> %res, ptr %a
  ret void
}

define <2 x i16> @mul_v2i16(<2 x i16> %op1, <2 x i16> %op2) {
; SVE-LABEL: mul_v2i16:
; SVE:       // %bb.0:
; SVE-NEXT:    ptrue p0.s, vl2
; SVE-NEXT:    // kill: def $d0 killed $d0 def $z0
; SVE-NEXT:    // kill: def $d1 killed $d1 def $z1
; SVE-NEXT:    mul z0.s, p0/m, z0.s, z1.s
; SVE-NEXT:    // kill: def $d0 killed $d0 killed $z0
; SVE-NEXT:    ret
;
; SVE2-LABEL: mul_v2i16:
; SVE2:       // %bb.0:
; SVE2-NEXT:    // kill: def $d0 killed $d0 def $z0
; SVE2-NEXT:    // kill: def $d1 killed $d1 def $z1
; SVE2-NEXT:    mul z0.s, z0.s, z1.s
; SVE2-NEXT:    // kill: def $d0 killed $d0 killed $z0
; SVE2-NEXT:    ret
  %res = mul <2 x i16> %op1, %op2
  ret <2 x i16> %res
}

define <4 x i16> @mul_v4i16(<4 x i16> %op1, <4 x i16> %op2) {
; SVE-LABEL: mul_v4i16:
; SVE:       // %bb.0:
; SVE-NEXT:    ptrue p0.h, vl4
; SVE-NEXT:    // kill: def $d0 killed $d0 def $z0
; SVE-NEXT:    // kill: def $d1 killed $d1 def $z1
; SVE-NEXT:    mul z0.h, p0/m, z0.h, z1.h
; SVE-NEXT:    // kill: def $d0 killed $d0 killed $z0
; SVE-NEXT:    ret
;
; SVE2-LABEL: mul_v4i16:
; SVE2:       // %bb.0:
; SVE2-NEXT:    // kill: def $d0 killed $d0 def $z0
; SVE2-NEXT:    // kill: def $d1 killed $d1 def $z1
; SVE2-NEXT:    mul z0.h, z0.h, z1.h
; SVE2-NEXT:    // kill: def $d0 killed $d0 killed $z0
; SVE2-NEXT:    ret
  %res = mul <4 x i16> %op1, %op2
  ret <4 x i16> %res
}

define <8 x i16> @mul_v8i16(<8 x i16> %op1, <8 x i16> %op2) {
; SVE-LABEL: mul_v8i16:
; SVE:       // %bb.0:
; SVE-NEXT:    ptrue p0.h, vl8
; SVE-NEXT:    // kill: def $q0 killed $q0 def $z0
; SVE-NEXT:    // kill: def $q1 killed $q1 def $z1
; SVE-NEXT:    mul z0.h, p0/m, z0.h, z1.h
; SVE-NEXT:    // kill: def $q0 killed $q0 killed $z0
; SVE-NEXT:    ret
;
; SVE2-LABEL: mul_v8i16:
; SVE2:       // %bb.0:
; SVE2-NEXT:    // kill: def $q0 killed $q0 def $z0
; SVE2-NEXT:    // kill: def $q1 killed $q1 def $z1
; SVE2-NEXT:    mul z0.h, z0.h, z1.h
; SVE2-NEXT:    // kill: def $q0 killed $q0 killed $z0
; SVE2-NEXT:    ret
  %res = mul <8 x i16> %op1, %op2
  ret <8 x i16> %res
}

define void @mul_v16i16(ptr %a, ptr %b) {
; SVE-LABEL: mul_v16i16:
; SVE:       // %bb.0:
; SVE-NEXT:    ldp q0, q3, [x1]
; SVE-NEXT:    ptrue p0.h, vl8
; SVE-NEXT:    ldp q1, q2, [x0]
; SVE-NEXT:    mul z0.h, p0/m, z0.h, z1.h
; SVE-NEXT:    movprfx z1, z2
; SVE-NEXT:    mul z1.h, p0/m, z1.h, z3.h
; SVE-NEXT:    stp q0, q1, [x0]
; SVE-NEXT:    ret
;
; SVE2-LABEL: mul_v16i16:
; SVE2:       // %bb.0:
; SVE2-NEXT:    ldp q0, q3, [x1]
; SVE2-NEXT:    ldp q1, q2, [x0]
; SVE2-NEXT:    mul z0.h, z1.h, z0.h
; SVE2-NEXT:    mul z1.h, z2.h, z3.h
; SVE2-NEXT:    stp q0, q1, [x0]
; SVE2-NEXT:    ret
  %op1 = load <16 x i16>, ptr %a
  %op2 = load <16 x i16>, ptr %b
  %res = mul <16 x i16> %op1, %op2
  store <16 x i16> %res, ptr %a
  ret void
}

define <2 x i32> @mul_v2i32(<2 x i32> %op1, <2 x i32> %op2) {
; SVE-LABEL: mul_v2i32:
; SVE:       // %bb.0:
; SVE-NEXT:    ptrue p0.s, vl2
; SVE-NEXT:    // kill: def $d0 killed $d0 def $z0
; SVE-NEXT:    // kill: def $d1 killed $d1 def $z1
; SVE-NEXT:    mul z0.s, p0/m, z0.s, z1.s
; SVE-NEXT:    // kill: def $d0 killed $d0 killed $z0
; SVE-NEXT:    ret
;
; SVE2-LABEL: mul_v2i32:
; SVE2:       // %bb.0:
; SVE2-NEXT:    // kill: def $d0 killed $d0 def $z0
; SVE2-NEXT:    // kill: def $d1 killed $d1 def $z1
; SVE2-NEXT:    mul z0.s, z0.s, z1.s
; SVE2-NEXT:    // kill: def $d0 killed $d0 killed $z0
; SVE2-NEXT:    ret
  %res = mul <2 x i32> %op1, %op2
  ret <2 x i32> %res
}

define <4 x i32> @mul_v4i32(<4 x i32> %op1, <4 x i32> %op2) {
; SVE-LABEL: mul_v4i32:
; SVE:       // %bb.0:
; SVE-NEXT:    ptrue p0.s, vl4
; SVE-NEXT:    // kill: def $q0 killed $q0 def $z0
; SVE-NEXT:    // kill: def $q1 killed $q1 def $z1
; SVE-NEXT:    mul z0.s, p0/m, z0.s, z1.s
; SVE-NEXT:    // kill: def $q0 killed $q0 killed $z0
; SVE-NEXT:    ret
;
; SVE2-LABEL: mul_v4i32:
; SVE2:       // %bb.0:
; SVE2-NEXT:    // kill: def $q0 killed $q0 def $z0
; SVE2-NEXT:    // kill: def $q1 killed $q1 def $z1
; SVE2-NEXT:    mul z0.s, z0.s, z1.s
; SVE2-NEXT:    // kill: def $q0 killed $q0 killed $z0
; SVE2-NEXT:    ret
  %res = mul <4 x i32> %op1, %op2
  ret <4 x i32> %res
}

define void @mul_v8i32(ptr %a, ptr %b) {
; SVE-LABEL: mul_v8i32:
; SVE:       // %bb.0:
; SVE-NEXT:    ldp q0, q3, [x1]
; SVE-NEXT:    ptrue p0.s, vl4
; SVE-NEXT:    ldp q1, q2, [x0]
; SVE-NEXT:    mul z0.s, p0/m, z0.s, z1.s
; SVE-NEXT:    movprfx z1, z2
; SVE-NEXT:    mul z1.s, p0/m, z1.s, z3.s
; SVE-NEXT:    stp q0, q1, [x0]
; SVE-NEXT:    ret
;
; SVE2-LABEL: mul_v8i32:
; SVE2:       // %bb.0:
; SVE2-NEXT:    ldp q0, q3, [x1]
; SVE2-NEXT:    ldp q1, q2, [x0]
; SVE2-NEXT:    mul z0.s, z1.s, z0.s
; SVE2-NEXT:    mul z1.s, z2.s, z3.s
; SVE2-NEXT:    stp q0, q1, [x0]
; SVE2-NEXT:    ret
  %op1 = load <8 x i32>, ptr %a
  %op2 = load <8 x i32>, ptr %b
  %res = mul <8 x i32> %op1, %op2
  store <8 x i32> %res, ptr %a
  ret void
}

define <1 x i64> @mul_v1i64(<1 x i64> %op1, <1 x i64> %op2) {
; SVE-LABEL: mul_v1i64:
; SVE:       // %bb.0:
; SVE-NEXT:    ptrue p0.d, vl1
; SVE-NEXT:    // kill: def $d0 killed $d0 def $z0
; SVE-NEXT:    // kill: def $d1 killed $d1 def $z1
; SVE-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; SVE-NEXT:    // kill: def $d0 killed $d0 killed $z0
; SVE-NEXT:    ret
;
; SVE2-LABEL: mul_v1i64:
; SVE2:       // %bb.0:
; SVE2-NEXT:    // kill: def $d0 killed $d0 def $z0
; SVE2-NEXT:    // kill: def $d1 killed $d1 def $z1
; SVE2-NEXT:    mul z0.d, z0.d, z1.d
; SVE2-NEXT:    // kill: def $d0 killed $d0 killed $z0
; SVE2-NEXT:    ret
  %res = mul <1 x i64> %op1, %op2
  ret <1 x i64> %res
}

define <2 x i64> @mul_v2i64(<2 x i64> %op1, <2 x i64> %op2) {
; SVE-LABEL: mul_v2i64:
; SVE:       // %bb.0:
; SVE-NEXT:    ptrue p0.d, vl2
; SVE-NEXT:    // kill: def $q0 killed $q0 def $z0
; SVE-NEXT:    // kill: def $q1 killed $q1 def $z1
; SVE-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; SVE-NEXT:    // kill: def $q0 killed $q0 killed $z0
; SVE-NEXT:    ret
;
; SVE2-LABEL: mul_v2i64:
; SVE2:       // %bb.0:
; SVE2-NEXT:    // kill: def $q0 killed $q0 def $z0
; SVE2-NEXT:    // kill: def $q1 killed $q1 def $z1
; SVE2-NEXT:    mul z0.d, z0.d, z1.d
; SVE2-NEXT:    // kill: def $q0 killed $q0 killed $z0
; SVE2-NEXT:    ret
  %res = mul <2 x i64> %op1, %op2
  ret <2 x i64> %res
}

define void @mul_v4i64(ptr %a, ptr %b) {
; SVE-LABEL: mul_v4i64:
; SVE:       // %bb.0:
; SVE-NEXT:    ldp q0, q3, [x1]
; SVE-NEXT:    ptrue p0.d, vl2
; SVE-NEXT:    ldp q1, q2, [x0]
; SVE-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; SVE-NEXT:    movprfx z1, z2
; SVE-NEXT:    mul z1.d, p0/m, z1.d, z3.d
; SVE-NEXT:    stp q0, q1, [x0]
; SVE-NEXT:    ret
;
; SVE2-LABEL: mul_v4i64:
; SVE2:       // %bb.0:
; SVE2-NEXT:    ldp q0, q3, [x1]
; SVE2-NEXT:    ldp q1, q2, [x0]
; SVE2-NEXT:    mul z0.d, z1.d, z0.d
; SVE2-NEXT:    mul z1.d, z2.d, z3.d
; SVE2-NEXT:    stp q0, q1, [x0]
; SVE2-NEXT:    ret
  %op1 = load <4 x i64>, ptr %a
  %op2 = load <4 x i64>, ptr %b
  %res = mul <4 x i64> %op1, %op2
  store <4 x i64> %res, ptr %a
  ret void
}

;
; SUB
;

define <4 x i8> @sub_v4i8(<4 x i8> %op1, <4 x i8> %op2) {
; CHECK-LABEL: sub_v4i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $z0
; CHECK-NEXT:    // kill: def $d1 killed $d1 def $z1
; CHECK-NEXT:    sub z0.h, z0.h, z1.h
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $z0
; CHECK-NEXT:    ret
  %res = sub <4 x i8> %op1, %op2
  ret <4 x i8> %res
}

define <8 x i8> @sub_v8i8(<8 x i8> %op1, <8 x i8> %op2) {
; CHECK-LABEL: sub_v8i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $z0
; CHECK-NEXT:    // kill: def $d1 killed $d1 def $z1
; CHECK-NEXT:    sub z0.b, z0.b, z1.b
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $z0
; CHECK-NEXT:    ret
  %res = sub <8 x i8> %op1, %op2
  ret <8 x i8> %res
}

define <16 x i8> @sub_v16i8(<16 x i8> %op1, <16 x i8> %op2) {
; CHECK-LABEL: sub_v16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $q0 killed $q0 def $z0
; CHECK-NEXT:    // kill: def $q1 killed $q1 def $z1
; CHECK-NEXT:    sub z0.b, z0.b, z1.b
; CHECK-NEXT:    // kill: def $q0 killed $q0 killed $z0
; CHECK-NEXT:    ret
  %res = sub <16 x i8> %op1, %op2
  ret <16 x i8> %res
}

define void @sub_v32i8(ptr %a, ptr %b) {
; CHECK-LABEL: sub_v32i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp q0, q3, [x1]
; CHECK-NEXT:    ldp q1, q2, [x0]
; CHECK-NEXT:    sub z0.b, z1.b, z0.b
; CHECK-NEXT:    sub z1.b, z2.b, z3.b
; CHECK-NEXT:    stp q0, q1, [x0]
; CHECK-NEXT:    ret
  %op1 = load <32 x i8>, ptr %a
  %op2 = load <32 x i8>, ptr %b
  %res = sub <32 x i8> %op1, %op2
  store <32 x i8> %res, ptr %a
  ret void
}

define <2 x i16> @sub_v2i16(<2 x i16> %op1, <2 x i16> %op2) {
; CHECK-LABEL: sub_v2i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $z0
; CHECK-NEXT:    // kill: def $d1 killed $d1 def $z1
; CHECK-NEXT:    sub z0.s, z0.s, z1.s
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $z0
; CHECK-NEXT:    ret
  %res = sub <2 x i16> %op1, %op2
  ret <2 x i16> %res
}

define <4 x i16> @sub_v4i16(<4 x i16> %op1, <4 x i16> %op2) {
; CHECK-LABEL: sub_v4i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $z0
; CHECK-NEXT:    // kill: def $d1 killed $d1 def $z1
; CHECK-NEXT:    sub z0.h, z0.h, z1.h
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $z0
; CHECK-NEXT:    ret
  %res = sub <4 x i16> %op1, %op2
  ret <4 x i16> %res
}

define <8 x i16> @sub_v8i16(<8 x i16> %op1, <8 x i16> %op2) {
; CHECK-LABEL: sub_v8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $q0 killed $q0 def $z0
; CHECK-NEXT:    // kill: def $q1 killed $q1 def $z1
; CHECK-NEXT:    sub z0.h, z0.h, z1.h
; CHECK-NEXT:    // kill: def $q0 killed $q0 killed $z0
; CHECK-NEXT:    ret
  %res = sub <8 x i16> %op1, %op2
  ret <8 x i16> %res
}

define void @sub_v16i16(ptr %a, ptr %b) {
; CHECK-LABEL: sub_v16i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp q0, q3, [x1]
; CHECK-NEXT:    ldp q1, q2, [x0]
; CHECK-NEXT:    sub z0.h, z1.h, z0.h
; CHECK-NEXT:    sub z1.h, z2.h, z3.h
; CHECK-NEXT:    stp q0, q1, [x0]
; CHECK-NEXT:    ret
  %op1 = load <16 x i16>, ptr %a
  %op2 = load <16 x i16>, ptr %b
  %res = sub <16 x i16> %op1, %op2
  store <16 x i16> %res, ptr %a
  ret void
}

define <2 x i32> @sub_v2i32(<2 x i32> %op1, <2 x i32> %op2) {
; CHECK-LABEL: sub_v2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $z0
; CHECK-NEXT:    // kill: def $d1 killed $d1 def $z1
; CHECK-NEXT:    sub z0.s, z0.s, z1.s
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $z0
; CHECK-NEXT:    ret
  %res = sub <2 x i32> %op1, %op2
  ret <2 x i32> %res
}

define <4 x i32> @sub_v4i32(<4 x i32> %op1, <4 x i32> %op2) {
; CHECK-LABEL: sub_v4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $q0 killed $q0 def $z0
; CHECK-NEXT:    // kill: def $q1 killed $q1 def $z1
; CHECK-NEXT:    sub z0.s, z0.s, z1.s
; CHECK-NEXT:    // kill: def $q0 killed $q0 killed $z0
; CHECK-NEXT:    ret
  %res = sub <4 x i32> %op1, %op2
  ret <4 x i32> %res
}

define void @sub_v8i32(ptr %a, ptr %b) {
; CHECK-LABEL: sub_v8i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp q0, q3, [x1]
; CHECK-NEXT:    ldp q1, q2, [x0]
; CHECK-NEXT:    sub z0.s, z1.s, z0.s
; CHECK-NEXT:    sub z1.s, z2.s, z3.s
; CHECK-NEXT:    stp q0, q1, [x0]
; CHECK-NEXT:    ret
  %op1 = load <8 x i32>, ptr %a
  %op2 = load <8 x i32>, ptr %b
  %res = sub <8 x i32> %op1, %op2
  store <8 x i32> %res, ptr %a
  ret void
}

define <1 x i64> @sub_v1i64(<1 x i64> %op1, <1 x i64> %op2) {
; CHECK-LABEL: sub_v1i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $z0
; CHECK-NEXT:    // kill: def $d1 killed $d1 def $z1
; CHECK-NEXT:    sub z0.d, z0.d, z1.d
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $z0
; CHECK-NEXT:    ret
  %res = sub <1 x i64> %op1, %op2
  ret <1 x i64> %res
}

define <2 x i64> @sub_v2i64(<2 x i64> %op1, <2 x i64> %op2) {
; CHECK-LABEL: sub_v2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $q0 killed $q0 def $z0
; CHECK-NEXT:    // kill: def $q1 killed $q1 def $z1
; CHECK-NEXT:    sub z0.d, z0.d, z1.d
; CHECK-NEXT:    // kill: def $q0 killed $q0 killed $z0
; CHECK-NEXT:    ret
  %res = sub <2 x i64> %op1, %op2
  ret <2 x i64> %res
}

define void @sub_v4i64(ptr %a, ptr %b) {
; CHECK-LABEL: sub_v4i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp q0, q3, [x1]
; CHECK-NEXT:    ldp q1, q2, [x0]
; CHECK-NEXT:    sub z0.d, z1.d, z0.d
; CHECK-NEXT:    sub z1.d, z2.d, z3.d
; CHECK-NEXT:    stp q0, q1, [x0]
; CHECK-NEXT:    ret
  %op1 = load <4 x i64>, ptr %a
  %op2 = load <4 x i64>, ptr %b
  %res = sub <4 x i64> %op1, %op2
  store <4 x i64> %res, ptr %a
  ret void
}

;
; ABS
;

define <4 x i8> @abs_v4i8(<4 x i8> %op1) {
; CHECK-LABEL: abs_v4i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h, vl4
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $z0
; CHECK-NEXT:    sxtb z0.h, p0/m, z0.h
; CHECK-NEXT:    abs z0.h, p0/m, z0.h
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $z0
; CHECK-NEXT:    ret
  %res = call <4 x i8> @llvm.abs.v4i8(<4 x i8> %op1, i1 false)
  ret <4 x i8> %res
}

define <8 x i8> @abs_v8i8(<8 x i8> %op1) {
; CHECK-LABEL: abs_v8i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.b, vl8
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $z0
; CHECK-NEXT:    abs z0.b, p0/m, z0.b
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $z0
; CHECK-NEXT:    ret
  %res = call <8 x i8> @llvm.abs.v8i8(<8 x i8> %op1, i1 false)
  ret <8 x i8> %res
}

define <16 x i8> @abs_v16i8(<16 x i8> %op1) {
; CHECK-LABEL: abs_v16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.b, vl16
; CHECK-NEXT:    // kill: def $q0 killed $q0 def $z0
; CHECK-NEXT:    abs z0.b, p0/m, z0.b
; CHECK-NEXT:    // kill: def $q0 killed $q0 killed $z0
; CHECK-NEXT:    ret
  %res = call <16 x i8> @llvm.abs.v16i8(<16 x i8> %op1, i1 false)
  ret <16 x i8> %res
}

define void @abs_v32i8(ptr %a) {
; CHECK-LABEL: abs_v32i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp q0, q1, [x0]
; CHECK-NEXT:    ptrue p0.b, vl16
; CHECK-NEXT:    abs z0.b, p0/m, z0.b
; CHECK-NEXT:    abs z1.b, p0/m, z1.b
; CHECK-NEXT:    stp q0, q1, [x0]
; CHECK-NEXT:    ret
  %op1 = load <32 x i8>, ptr %a
  %res = call <32 x i8> @llvm.abs.v32i8(<32 x i8> %op1, i1 false)
  store <32 x i8> %res, ptr %a
  ret void
}

define <2 x i16> @abs_v2i16(<2 x i16> %op1) {
; CHECK-LABEL: abs_v2i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s, vl2
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $z0
; CHECK-NEXT:    sxth z0.s, p0/m, z0.s
; CHECK-NEXT:    abs z0.s, p0/m, z0.s
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $z0
; CHECK-NEXT:    ret
  %res = call <2 x i16> @llvm.abs.v2i16(<2 x i16> %op1, i1 false)
  ret <2 x i16> %res
}

define <4 x i16> @abs_v4i16(<4 x i16> %op1) {
; CHECK-LABEL: abs_v4i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h, vl4
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $z0
; CHECK-NEXT:    abs z0.h, p0/m, z0.h
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $z0
; CHECK-NEXT:    ret
  %res = call <4 x i16> @llvm.abs.v4i16(<4 x i16> %op1, i1 false)
  ret <4 x i16> %res
}

define <8 x i16> @abs_v8i16(<8 x i16> %op1) {
; CHECK-LABEL: abs_v8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h, vl8
; CHECK-NEXT:    // kill: def $q0 killed $q0 def $z0
; CHECK-NEXT:    abs z0.h, p0/m, z0.h
; CHECK-NEXT:    // kill: def $q0 killed $q0 killed $z0
; CHECK-NEXT:    ret
  %res = call <8 x i16> @llvm.abs.v8i16(<8 x i16> %op1, i1 false)
  ret <8 x i16> %res
}

define void @abs_v16i16(ptr %a) {
; CHECK-LABEL: abs_v16i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp q0, q1, [x0]
; CHECK-NEXT:    ptrue p0.h, vl8
; CHECK-NEXT:    abs z0.h, p0/m, z0.h
; CHECK-NEXT:    abs z1.h, p0/m, z1.h
; CHECK-NEXT:    stp q0, q1, [x0]
; CHECK-NEXT:    ret
  %op1 = load <16 x i16>, ptr %a
  %res = call <16 x i16> @llvm.abs.v16i16(<16 x i16> %op1, i1 false)
  store <16 x i16> %res, ptr %a
  ret void
}

define <2 x i32> @abs_v2i32(<2 x i32> %op1) {
; CHECK-LABEL: abs_v2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s, vl2
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $z0
; CHECK-NEXT:    abs z0.s, p0/m, z0.s
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $z0
; CHECK-NEXT:    ret
  %res = call <2 x i32> @llvm.abs.v2i32(<2 x i32> %op1, i1 false)
  ret <2 x i32> %res
}

define <4 x i32> @abs_v4i32(<4 x i32> %op1) {
; CHECK-LABEL: abs_v4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s, vl4
; CHECK-NEXT:    // kill: def $q0 killed $q0 def $z0
; CHECK-NEXT:    abs z0.s, p0/m, z0.s
; CHECK-NEXT:    // kill: def $q0 killed $q0 killed $z0
; CHECK-NEXT:    ret
  %res = call <4 x i32> @llvm.abs.v4i32(<4 x i32> %op1, i1 false)
  ret <4 x i32> %res
}

define void @abs_v8i32(ptr %a) {
; CHECK-LABEL: abs_v8i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp q0, q1, [x0]
; CHECK-NEXT:    ptrue p0.s, vl4
; CHECK-NEXT:    abs z0.s, p0/m, z0.s
; CHECK-NEXT:    abs z1.s, p0/m, z1.s
; CHECK-NEXT:    stp q0, q1, [x0]
; CHECK-NEXT:    ret
  %op1 = load <8 x i32>, ptr %a
  %res = call <8 x i32> @llvm.abs.v8i32(<8 x i32> %op1, i1 false)
  store <8 x i32> %res, ptr %a
  ret void
}

define <1 x i64> @abs_v1i64(<1 x i64> %op1) {
; CHECK-LABEL: abs_v1i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d, vl1
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $z0
; CHECK-NEXT:    abs z0.d, p0/m, z0.d
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $z0
; CHECK-NEXT:    ret
  %res = call <1 x i64> @llvm.abs.v1i64(<1 x i64> %op1, i1 false)
  ret <1 x i64> %res
}

define <2 x i64> @abs_v2i64(<2 x i64> %op1) {
; CHECK-LABEL: abs_v2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d, vl2
; CHECK-NEXT:    // kill: def $q0 killed $q0 def $z0
; CHECK-NEXT:    abs z0.d, p0/m, z0.d
; CHECK-NEXT:    // kill: def $q0 killed $q0 killed $z0
; CHECK-NEXT:    ret
  %res = call <2 x i64> @llvm.abs.v2i64(<2 x i64> %op1, i1 false)
  ret <2 x i64> %res
}

define void @abs_v4i64(ptr %a) {
; CHECK-LABEL: abs_v4i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp q0, q1, [x0]
; CHECK-NEXT:    ptrue p0.d, vl2
; CHECK-NEXT:    abs z0.d, p0/m, z0.d
; CHECK-NEXT:    abs z1.d, p0/m, z1.d
; CHECK-NEXT:    stp q0, q1, [x0]
; CHECK-NEXT:    ret
  %op1 = load <4 x i64>, ptr %a
  %res = call <4 x i64> @llvm.abs.v4i64(<4 x i64> %op1, i1 false)
  store <4 x i64> %res, ptr %a
  ret void
}

declare <4 x i8> @llvm.abs.v4i8(<4 x i8>, i1)
declare <8 x i8> @llvm.abs.v8i8(<8 x i8>, i1)
declare <16 x i8> @llvm.abs.v16i8(<16 x i8>, i1)
declare <32 x i8> @llvm.abs.v32i8(<32 x i8>, i1)
declare <4 x i16> @llvm.abs.v4i16(<4 x i16>, i1)
declare <2 x i16> @llvm.abs.v2i16(<2 x i16>, i1)
declare <8 x i16> @llvm.abs.v8i16(<8 x i16>, i1)
declare <16 x i16> @llvm.abs.v16i16(<16 x i16>, i1)
declare <2 x i32> @llvm.abs.v2i32(<2 x i32>, i1)
declare <4 x i32> @llvm.abs.v4i32(<4 x i32>, i1)
declare <8 x i32> @llvm.abs.v8i32(<8 x i32>, i1)
declare <1 x i64> @llvm.abs.v1i64(<1 x i64>, i1)
declare <2 x i64> @llvm.abs.v2i64(<2 x i64>, i1)
declare <4 x i64> @llvm.abs.v4i64(<4 x i64>, i1)

