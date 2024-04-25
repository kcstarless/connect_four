#spec/board_spec.rb
require './lib/board'

describe Board do
  subject(:new_board) { described_class.new }

  describe '#initialize' do
    context 'when board is initialized' do
      it 'Check number of rows to be created is 6' do
        board = new_board.instance_variable_get(:@board)
        expect(board.length).to eq(6)
      end

      it 'Check number of columns to be created is 7' do
        board = new_board.instance_variable_get(:@board)
        expect(board[0].length).to eq(7)
      end
    end
  end

  describe '#place_marker' do
    let(:player) { "\u25CF" }
    let(:col) { 4 }

    context 'When marker is put in the fourth colmun' do
      it 'It correctly places the marker' do
        new_board.place_marker(col, player)
        expect(new_board.board[5][col]).to eq(player)
      end
    end
  end
end
