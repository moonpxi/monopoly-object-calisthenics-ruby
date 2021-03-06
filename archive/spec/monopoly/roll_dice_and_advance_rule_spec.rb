require_relative '../spec_helper'

describe RollDiceAndAdvanceRule do
  let(:player) { Player.at(Square.new(10)) }
  let(:dice_roller) { double('dices') }
  let(:rule) { RollDiceAndAdvanceRule.new(dice_roller) }

  it 'should advance player by the result of the dice roll' do
    dice_roller.stub(:roll).and_return(RollResult.new(5))

    rule.apply_to(player)

    player.current_location.should == Square.new(15)
  end

end
