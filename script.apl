⍝ problem 1 part 1
⍝input←⍎⍤1⊢↑⊃⎕NGET'/Users/Tortle/Desktop/input.txt'1
input←0 0 0 0 0 ⍝ so it doesn't crash
answer_A_A←+/(1∘↓>¯1∘↓) ⍝input

⍝ problem 1 part 2
averageMap←1↓¯1↓(⊢+¯1∘⌽+1∘⌽)input ⍝ pair up three copies of same array, sum them each
answer_A_B←+/(1∘↓>¯1∘↓)averageMap

⍝ problem 2 part 1
location ← 2⍴0	⍝ location coordinates
forward←{location+←1 0×⍵}
down←{location+←0 1×⍵}
up←{location-←0 1×⍵}				⍝ the three functions provided in the input format
⍝ input←↑⊃⎕NGET'/Users/Tortle/Desktop/input.txt'1
⍝ ⍎⍤1⊢input						⍝ execute a matrix
answer_B_A←×/location

⍝ problem 2 part 2
location←3⍴0		⍝ in addition to resetting the value for location, add the third aim value
down←{location+←0 0 ⍵}
up←{location-←0 0 ⍵}
forward←{location+←⍵ 0 0⋄location+←0 ⍵ 0×(1⌽location)}	⍝ redefine the three functions
⍝ ⍎⍤1⊢input
answer_B_B←×/2↑location

⍝ problem 3 part 1
input←⍎⍤0⊢↑⊃⎕NGET'/Users/Tortle/Desktop/input.txt'1
halfTally←2÷⍨≢input
gamma←halfTally<+/⍉input
answer_C_A←(2∘⊥×2∘⊥∘~) gamma

⍝ problem 3 part 2 (not solved yet)
mask←1,0⍴⍨1-⍨≢⍉input
oneReductionOxy←{
	mask←,1↑⍵
	input←1↓⍵
	threshold←2÷⍨≢input
	columnWeCareAbout←(⍉input)⌷⍨⍸mask
	mostCommonBitInThisColumn←threshold<+/columnWeCareAbout
	rowMask←mostCommonBitInThisColumn∘=¨columnWeCareAbout
	output←rowMask⌿input
	(¯1⌽mask)⍪output
}
oneReductionCO←{
	mask←,1↑⍵
	input←1↓⍵
	threshold←2÷⍨≢input
	columnWeCareAbout←(⍉input)⌷⍨⍸mask
	mostCommonBitInThisColumn←threshold<+/columnWeCareAbout
	rowMask←mostCommonBitInThisColumn∘≠¨columnWeCareAbout
	output←rowMask⌿input
	(¯1⌽mask)⍪output
}
rate←{2⊥,1↓(⍺⍺⍣{3≥≢⍵})⍺⍪⍵}
oxygenRating←mask (oneReductionOxy rate) input
CORating←mask (oneReductionCO rate) input
⎕←lifeSupportRating←CORating×oxygenRating