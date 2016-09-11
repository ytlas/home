module L01B where

-- The suit
data Suit = Hearts | Clubs | Diamonds | Spades
  deriving (Show,Eq)

-- Colour
data Colour = Red | Black
  deriving Show

-- Colour (Eq)
colour :: Suit -> Colour
colour Clubs  =  Black
colour Spades =  Black
colour _      =  Red

-- colour s | s == Spades = Black
--          | s == Clubs  = Black
--          | otherwise   = Red

-- Rank
data Rank = Numeric Int | Jack | Queen | King | Ace
  deriving (Show,Eq)

legal :: Rank -> Bool
legal (Numeric n) = n > 1 && n < 11
legal _           = True

-- Rank1 `rankBeats` rank2 ?
rankBeats :: Rank -> Rank -> Bool
rankBeats _           Ace         = False
rankBeats Ace         _           = True
rankBeats _           King        = False
rankBeats King        _           = True
rankBeats _           Queen       = False
rankBeats Queen       _           = True
rankBeats _           Jack        = False
rankBeats Jack        _           = True
rankBeats (Numeric m) (Numeric n) = m > n

data Card = Card {rank::Rank, suit::Suit}
  deriving (Show,Eq)

acespades = Card Ace Spades

cardBeats :: Card -> Card -> Bool
cardBeats (Card r1 _) (Card r2 _) = rankBeats r1 r2

data Hand = Empty | Add Card Hand
  deriving Show

egHand1 :: Hand
egHand1 = Add acespades Empty
egHand2 = Add (Card King Diamonds) egHand1
egHand3 = Add (Card Jack Clubs)   egHand2
egHand4 = Add (Card Jack Clubs)   egHand3

size :: Hand -> Int
size Empty     = 0
size (Add _ h) = 1 + (size h)

jacks h = numberOf Jack h
kings h = numberOf King h
queens h = numberOf Queen h
aces h = numberOf Ace h
numberOf _ Empty = 0
numberOf t (Add c h) | rank c == t = 1 + (numberOf t h)
                     | otherwise = (numberOf t h)

handBeats :: Hand -> Card -> Bool
handBeats Empty      _ = False
handBeats (Add c' h) c = cardBeats c' c || handBeats h c
