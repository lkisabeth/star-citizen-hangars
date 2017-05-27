ships_list = {
    "Aurora LN" => {
      :manufacturer => "Roberts Space Industries",
      :role => "Militia / Patrol",
      :description => "With a more robust shield generator and a pair of additional hard points, the Aurora Legionnaire is a dedicated combat fighter, built to handle any obstacle the universe can throw at you.",
      :production_state => "Flight Ready"
    },
    "Constellation Andromeda" => {
      :manufacturer => "Roberts Space Industries",
      :role => "Multi-Function",
      :description => "The Constellation Andromeda, a multi-person freighter, is the most popular ship in RSI's current production array.  Constellations are beloved by smugglers and merchants alike because they are modular, high powered... and just downright iconic-looking.",
      :production_state => "Flight Ready"
    },
    "M50 Interceptor" => {
      :manufacturer => "Origin Jumpworks",
      :role => "Racing / Interception",
      :description => "If you want to get from point A to point B as quickly as possible and with as much style as possible then ORIGIN's M50 is for you.  Featuring supercharged engines that counter a tiny weapons loadout, the M50 is a ship for going FAST.",
      :production_state => "Flight Ready"
    },
    "Cutlass Black" => {
      :manufacturer => "Drake Interplanetary",
      :role => "Militia / Patrol",
      :description => "Drake Interplanetary claims that the Cutlass Black is a low-cost, easy-to-maintain solution for local in-system militia units.  The larger-than-average cargo hold, RIO seat and dedicated tractor mount are, the company literature insists, for facilitating search and rescue operations.",
      :production_state => "Flight Ready"
    },
    "Avenger Titan" => {
      :manufacturer => "Aegis Dynamics",
      :role => "Light Cargo Hauler",
      :description => "Lacking the Prisoner Cells of the Stalker or the EMP Generator of the Warlock, the Titan's hold is free to carry cargo.  Couple that available space with the Avenger's tried and true combat abilities and you've got a light cargo hauler that's more than capable of handling itself in a fight. *This is the standard Avenger chassis with the Titan Cargo Module pre-installed.*",
      :production_state => "Flight Ready"
    },
    "Starfarer" => {
      :manufacturer => "Musashi Industrail & Starflight Concern",
      :role => "Refuel / Transport",
      :description => "The Starfarer differs from traditional bulk freighters in one key way: it is a dedicated fuel platform.  The Starfarer is designed not only to load, store and protect fuel stasis units, it is designed to take in spaceborne hydrogen and then refine it for use without landing.  The Starfarer can be used to ferry traditional bulk cargo pods but in such cases the fuel refining equipment would be useless.  This equipment is modular and can be swapped out for another mission package.",
      :production_state => "Flight Ready"
    },
    "Retaliator Bomber" => {
      :manufacturer => "Aegis Dynamics",
      :role => "Heavy Bomber",
      :description => "This version of the Retaliator includes the bomb bay and torpedo launcher.",
      :production_state => "Hangar Ready"
    },
    "Vanduul Scythe" => {
      :manufacturer => "Vanduul",
      :role => "Medium Fighter",
      :description => "Fast becoming the symbol of the Vanduul Race, the Scythe is the foot soldier in every raid and the target of every human fighter pilot.  Featuring a hefty weapons payload, the Scythe's real asset is its maneuverability, found in the twin main and twelve manuevering thrusters.",
      :production_state => "Flight Ready"
    },
    "Javelin-Class Destroyer" => {
      :manufacturer => "Aegis Dynamics",
      :role => "Capital Ship",
      :description => "Designed for use by the UEE military, the Javelin is a massive, modular capital ship that can be appropriated for entrepreneurial use.  With a detailed interior, plenty of modular room options and a high crew capacity, the Javelin is a ship intended for group play.",
      :production_state => "In Production"
    }
  }

ships_list.each do |model, ship_hash|
  ship = Ship.new
  ship.model = model
  ship_hash.each do |attribute, value|
      ship[attribute] = value
  end
  ship.save
end
