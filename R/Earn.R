#' @name Earned
#' 
#' @title Earned
#' 
#' @description Determines the amount earned in a particular period, given effective and expiration dates. Uniform earning is assumed.
#' 
#' @param EffectiveDate A date, or something which may be converted to a date. May be a vector.
#' @param ExpirationDate A date, or something which may be converted to a date. May be a vector.
#' @param EarnStart A date, or something which may be converted to a date. May NOT be a vector.
#' @param EarnEnd A date, or something which may be converted to a date. May NOT be a vector.
#' @param Amount Number
#' 
#' @return Vector of amounts earned during the period in question
#' 
#' @details
#' 
#' 
#' |-- <FD --- XD> -- <ES ---------------- EE> --------------- |
#' 
#' |-- <FD ---------- <ES ---- XD> ------- EE> --------------- |
#' 
#' |----------------- <ES -- <FD -- XD> -- EE> --------------- |
#' 
#' |----------------- <ES -------- <FD --- EE> ----- XD> ----- |
#' 
#' |----------------- <ES ---------------- EE> - <FD --- XD> - |
#' 
#' |-- <FD ---------- <ES ---------------- EE> --------- XD> - |
#' 
#' =============================================================
#' |-- <FD ---- u> -- <l ----------------- EE> --------------- |
#' 
#' |-- <FD ---------- <l ----- u> -------- EE> --------------- |
#' 
#' |----------------- <ES -- <l ---- u> -- EE> --------------- |
#' 
#' |----------------- <ES -------- <l ----- u> ----- XD> ----- |
#' 
#' |----------------- <ES ----------------- u> - <l ---- XD> - |
#' 
#' |-- <FD ---------- <l ------------------ u> --------- XD> - |
#'  
Earned <- function(EffectiveDate, ExpirationDate, EarnStart, EarnEnd, Amount){
  
  # Check inputs
  # Confirm variable types
  # Confirm sensible input
  if (any(EarnStart >= EarnEnd)){
    stop("Earning periods are not consistent.")
  }
  
  if (any(EffectiveDate >= ExpirationDate)){
    stop("Effective dates are not consistent.")
  }
  
  effSpan <- ExpirationDate - EffectiveDate + 1
  
  lower <- pmax(EffectiveDate, EarnStart)
  upper <- pmin(ExpirationDate, EarnEnd)
  
  shortPolicy <- (EffectiveDate > EarnStart)
  earnSpan <- ifelse(EffectiveDate > EarnStart & ExpirationDate < EarnEnd
                    , EarnEnd - EarnStart + 1
                    , upper - lower + 1)
  
  earnSpan <- pmax(earnSpan, 0)
  
  Earned <- Amount * as.double(earnSpan) / as.double(effSpan)
  
}