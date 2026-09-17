--#region Atlases

SMODS.Atlas {
    key = 'restlessgambler',
    path = 'restless_gambler.png',
    px = 71,
    py = 95
}


--jokers

SMODS.Joker {
    key = 'restlessjoker',
    -- descriptive stuff
    loc_txt = {
        name = 'The Restless Gambler',
        text = {
            "one in three chance to win big",
            "and gain 10 mult"
        }
    },
    config = {
        extra = {
            mult = 10
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,
    -- stuff
    rarity = 2,
    atlas = 'restlessgambler',
    -- calculation
    calculate = function(self, card, context)
        -- context
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}