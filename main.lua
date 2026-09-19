--#region Atlases

SMODS.Atlas {
    key = 'jokers',
    path = 'Jokers.png',
    px = 71,
    py = 95
}


--jokers

SMODS.Joker {
    key = 'restlessgambler',
    -- descriptive stuff
    loc_txt = {
        name = 'The Restless Gambler',
        text = {
            "one in two chance to win big",
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
    rarity = 1,
    atlas = 'jokers',
    pos = {
        x = 0,
        y = 0
    },
    -- calculation
    calculate = function(self, card, context)
        -- context
        if context.joker_main then
            message = "come on i can win this..."
            if pseudorandom("Joker") <= 0.5 then
                return {
                    message = "YESSSS",
                    xmult = card.ability.extra.mult
            }
            else
                return {
                    message = "Awww dang it :("
                }
            end
        end
    end
}
SMODS.Joker {
    key = 'horrorjoker',
    -- descriptive stuff
    loc_txt = {
        name = 'Scary Joker',
        text = {
            "If there is a face card",
            "apply a Evil Seal to it."
        }
    },
    config = {
        extra = {
            xscore = 3
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xscore
            }
        }
    end,
    -- stuff
    rarity = 2,
    atlas = 'jokers',
    pos = {
        x = 1,
        y = 0
    },
    -- calculation
    calculate = function(self, card, context)
        if context.before then
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:is_face() then
                    scored_card:set_seal("utm_evilseal")
                    return {
                        message = {
                            'hehehehe, thanksss',
                            'humannn.'
                        }
                    }
                end
            end
        end
    end
}
-- seal atlas (scrapped)
SMODS.Atlas {
    key = "evilseal",
    path = "evilseal.png",
    px = 71,
    py = 95
}

-- scrappped seal due to problems
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
