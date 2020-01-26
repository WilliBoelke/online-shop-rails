# frozen_string_literal: true

module ProductsHelper
  PRODUCT_SORT = {
      NEW_TO_OLD: { method: :new_to_old, label: "Neuste zuerst" },
      OLD_TO_NEW: { method: :old_to_new, label: "Alt bis neu" },
      LOW_TO_HIGH: { method: :low_to_high, label: "Preis aufsteigend" },
      HIGH_TO_LOW: { method: :high_to_low, label: "Preis absteigend" },
      ALPHABETIC: { method: :alphabetic, label: "Alphabetisch" },
  }
  PRODUCT_FILTER = {
      ALL_CLOTHES: { method: :all_types, label: "Alle" },
      T_SHIRTS: { method: :shirt_only, label: "T-Shirts" },
      PULLOVER: { method: :pullover_only, label: "Pullover" },
  }
end
