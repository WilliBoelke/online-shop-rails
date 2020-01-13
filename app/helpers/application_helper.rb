module ApplicationHelper
  #default=german

  # sort
  PRODUCT_SORT = {
      NEW_TO_OLD_L =>  "Neuste zuerst",
      OLD_TO_NEW_L =>  "Alt bis neu",
      LOW_TO_HIGH_L =>  "Preis aufsteigend",
      HIGH_TO_LOW_L =>  "Preis absteigend",
      ALPHABETIC_L =>  "alphabetisch"
  }
  $new_to_old_l = "Neuste zuerst"
  $old_to_new_l = "Alt bis neu"
  $low_to_high_l = "Preis aufsteigend"
  $high_to_low_l = "Preis absteigend"
  $alphabetic_l = "Alphabetisch"

  # filter
  PRODUCT_FILTER = {
      T_SHIRTS => "T-Shirts",
      PULLOVER => "Pullover",
      ALL_CLOTHES => "Alle"
  }

  $t_shirt_l = "T-Shirts"
  $pullover_l = "Pullover"
  $all_clothes_l = "Alle"

end
