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
SMODS.Joker {
        key = 'pencil',
    -- descriptive stuff
    loc_txt = {
        name = 'Pencil',
        text = {
            "its a pencil, draws {X:mult, C:white}X#1#{} Mult"
        }
    },
    config = {
        extra = {
            mult = 2
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
        x = 4,
        y = 0
    },
    -- calculation
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.mult
            }
        end
    end
}
SMODS.Joker {
    key = 'emptyjoker',
    -- descriptive stuff
    loc_txt = {
        name = 'Empty Joker?',
        text = {
            "does nothing?"
        }
    },
    config = {
        extra = {
            transformed = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.transformed
            }
        }
    end,
    -- stuff
    rarity = 1,
    atlas = 'jokers',
    pos = {
        x = 2,
        y = 0
    },
    -- calculation
    calculate = function(self, card, context)
        if next(SMODS.find_card('j_utm_pencil', 1)) then
            card:set_ability("j_utm_superjoker")
        end
    end 

}
SMODS.Joker {
    key = 'superjoker',
    -- descriptive stuff
    loc_txt = {
        name = 'Super Joker',
        text = {
            "Damages blind by 40%"
        }
    },
    config = {
        extra = {
            damage = 0.6,
            damaged = false
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.damage
            }
        }
    end,
    -- stuff
    rarity = 3,
    atlas = 'jokers',
    pos = {
        x = 3,
        y = 0
    },
    -- calculation
    calculate = function(self, card, context)
        if G.GAME.blind and G.GAME.blind.in_blind then
            if card.ability.extra.damaged == false then
                G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.damage
                card.ability.extra.damaged = true
            end
        else
            card.ability.extra.damaged = false
        end

    end 

}