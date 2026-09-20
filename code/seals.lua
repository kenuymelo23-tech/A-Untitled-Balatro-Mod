-- seal atlas (no longer scrapped)
SMODS.Atlas {
    key = "evilseal",
    path = "evilseal.png",
    px = 71,
    py = 95
}

-- no longer scrappped seal
SMODS.Seal {
    key = "evilseal",
    badge_colour = HEX("1d4fd7"),
    config = {
        xmult = 6
    },
    loc_txt = {
        -- Badge name (displayed on card description when seal is applied)
        label = 'Evil Seal',
        -- Tooltip description
        name = 'Evil Seal',
        text = {
            'gives {X:mult,C:white}X#4#{} Mult'
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.seal.xmult
            }
        }
    end,
    atlas = "evilseal",
    pos = {
        x = 0,
        y = 0
    },

    -- self - this seal prototype
    -- card - card this seal is applied to
    calculate = function(self, card, context)
        -- main_scoring context is used whenever the card is scored
        if context.main_scoring then
            return {
                xmult = card.ability.seal.xmult
            }
        end
    end,
}