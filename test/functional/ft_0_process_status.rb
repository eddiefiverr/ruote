
#
# Testing Ruote (OpenWFEru)
#
# Fri May 15 09:51:28 JST 2009
#

require File.dirname(__FILE__) + '/base'

require 'ruote/part/hash_participant'


class FtProcessStatusTest < Test::Unit::TestCase
  include FunctionalBase

  def test_process_status

    pdef = Ruote.process_definition do
      participant :ref => 'alpha'
    end

    @engine.register_participant :alpha, Ruote::HashParticipant

    fei = @engine.launch(pdef, :workitem => { 'kilroy' => 'was here' })

    ps = @engine.process_status(fei.wfid)

    puts ps

    assert 'no-name', ps.definition_name
  end
end

