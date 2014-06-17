#!/usr/bin/env ruby
# Generated by the protocol buffer compiler. DO NOT EDIT!

require 'protocol_buffers'

module Main
  # forward declarations
  class ExecutionStatus < ::ProtocolBuffers::Message;
  end
  class KillProcessRequest < ::ProtocolBuffers::Message;
  end
  class ExecutionStatusResponse < ::ProtocolBuffers::Message;
  end
  class ExecutionStartingRequest < ::ProtocolBuffers::Message;
  end
  class SpecExecutionStartingRequest < ::ProtocolBuffers::Message;
  end
  class SpecExecutionEndingRequest < ::ProtocolBuffers::Message;
  end
  class ScenarioExecutionStartingRequest < ::ProtocolBuffers::Message;
  end
  class ScenarioExecutionEndingRequest < ::ProtocolBuffers::Message;
  end
  class StepExecutionStartingRequest < ::ProtocolBuffers::Message;
  end
  class StepExecutionEndingRequest < ::ProtocolBuffers::Message;
  end
  class ExecutionInfo < ::ProtocolBuffers::Message;
  end
  class SpecInfo < ::ProtocolBuffers::Message;
  end
  class ScenarioInfo < ::ProtocolBuffers::Message;
  end
  class StepInfo < ::ProtocolBuffers::Message;
  end
  class ExecuteStepRequest < ::ProtocolBuffers::Message;
  end
  class ProtoTable < ::ProtocolBuffers::Message;
  end
  class TableRow < ::ProtocolBuffers::Message;
  end
  class Argument < ::ProtocolBuffers::Message;
  end
  class StepValidateRequest < ::ProtocolBuffers::Message;
  end
  class StepValidateResponse < ::ProtocolBuffers::Message;
  end
  class ExecutionEndingRequest < ::ProtocolBuffers::Message;
  end
  class StepNamesRequest < ::ProtocolBuffers::Message;
  end
  class StepNamesResponse < ::ProtocolBuffers::Message;
  end
  class Message < ::ProtocolBuffers::Message;
  end

  class ExecutionStatus < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.ExecutionStatus"

    required :bool, :passed, 1
    optional :bool, :recoverableError, 2
    optional :string, :errorMessage, 3
    optional :string, :stackTrace, 4
    optional :bytes, :screenShot, 5
  end

  class KillProcessRequest < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.KillProcessRequest"

  end

  class ExecutionStatusResponse < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.ExecutionStatusResponse"

    required ::Main::ExecutionStatus, :executionStatus, 1
  end

  class ExecutionStartingRequest < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.ExecutionStartingRequest"

    optional ::Main::ExecutionInfo, :currentExecutionInfo, 1
  end

  class SpecExecutionStartingRequest < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.SpecExecutionStartingRequest"

    optional ::Main::ExecutionInfo, :currentExecutionInfo, 1
  end

  class SpecExecutionEndingRequest < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.SpecExecutionEndingRequest"

    optional ::Main::ExecutionInfo, :currentExecutionInfo, 1
  end

  class ScenarioExecutionStartingRequest < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.ScenarioExecutionStartingRequest"

    optional ::Main::ExecutionInfo, :currentExecutionInfo, 1
  end

  class ScenarioExecutionEndingRequest < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.ScenarioExecutionEndingRequest"

    optional ::Main::ExecutionInfo, :currentExecutionInfo, 1
  end

  class StepExecutionStartingRequest < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.StepExecutionStartingRequest"

    optional ::Main::ExecutionInfo, :currentExecutionInfo, 1
  end

  class StepExecutionEndingRequest < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.StepExecutionEndingRequest"

    optional ::Main::ExecutionInfo, :currentExecutionInfo, 1
  end

  class ExecutionInfo < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.ExecutionInfo"

    optional ::Main::SpecInfo, :currentSpec, 1
    optional ::Main::ScenarioInfo, :currentScenario, 2
    optional ::Main::StepInfo, :currentStep, 3
    optional :string, :stacktrace, 4
  end

  class SpecInfo < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.SpecInfo"

    required :string, :name, 1
    required :string, :fileName, 2
    required :bool, :isFailed, 3
    repeated :string, :tags, 4
  end

  class ScenarioInfo < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.ScenarioInfo"

    required :string, :name, 1
    required :bool, :isFailed, 2
    repeated :string, :tags, 3
  end

  class StepInfo < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.StepInfo"

    required ::Main::ExecuteStepRequest, :step, 1
    required :bool, :isFailed, 2
  end

  class ExecuteStepRequest < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.ExecuteStepRequest"

    required :string, :actualStepText, 1
    required :string, :parsedStepText, 2
    optional :bool, :scenarioFailing, 3
    repeated ::Main::Argument, :args, 4
  end

  class ProtoTable < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.ProtoTable"

    repeated ::Main::TableRow, :rows, 1
  end

  class TableRow < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.TableRow"

    repeated :string, :cells, 1
  end

  class Argument < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.Argument"

    required :string, :type, 1
    optional :string, :value, 2
    optional ::Main::ProtoTable, :table, 3
  end

  class StepValidateRequest < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.StepValidateRequest"

    required :string, :stepText, 1
    required :int32, :numberOfArguments, 2
  end

  class StepValidateResponse < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.StepValidateResponse"

    required :bool, :isValid, 1
    optional :string, :errorMessage, 2
  end

  class ExecutionEndingRequest < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.ExecutionEndingRequest"

    optional ::Main::ExecutionInfo, :currentExecutionInfo, 1
  end

  class StepNamesRequest < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.StepNamesRequest"

  end

  class StepNamesResponse < ::ProtocolBuffers::Message
    set_fully_qualified_name "main.StepNamesResponse"

    repeated :string, :steps, 1
  end

  class Message < ::ProtocolBuffers::Message
    # forward declarations

    # enums
    module MessageType
      include ::ProtocolBuffers::Enum

      set_fully_qualified_name "main.Message.MessageType"

      ExecutionStarting = 0
      SpecExecutionStarting = 1
      SpecExecutionEnding = 2
      ScenarioExecutionStarting = 3
      ScenarioExecutionEnding = 4
      StepExecutionStarting = 5
      StepExecutionEnding = 6
      ExecuteStep = 7
      ExecutionEnding = 8
      StepValidateRequest = 9
      StepValidateResponse = 10
      ExecutionStatusResponse = 11
      StepNamesRequest = 12
      StepNamesResponse = 13
      KillProcessRequest = 14
    end

    set_fully_qualified_name "main.Message"

    required ::Main::Message::MessageType, :messageType, 1
    required :int64, :messageId, 2
    optional ::Main::ExecutionStartingRequest, :executionStartingRequest, 3
    optional ::Main::SpecExecutionStartingRequest, :specExecutionStartingRequest, 4
    optional ::Main::SpecExecutionEndingRequest, :specExecutionEndingRequest, 5
    optional ::Main::ScenarioExecutionStartingRequest, :scenarioExecutionStartingRequest, 6
    optional ::Main::ScenarioExecutionEndingRequest, :scenarioExecutionEndingRequest, 7
    optional ::Main::StepExecutionStartingRequest, :stepExecutionStartingRequest, 8
    optional ::Main::StepExecutionEndingRequest, :stepExecutionEndingRequest, 9
    optional ::Main::ExecuteStepRequest, :executeStepRequest, 10
    optional ::Main::ExecutionEndingRequest, :executionEndingRequest, 11
    optional ::Main::StepValidateRequest, :stepValidateRequest, 12
    optional ::Main::StepValidateResponse, :stepValidateResponse, 13
    optional ::Main::ExecutionStatusResponse, :executionStatusResponse, 14
    optional ::Main::StepNamesRequest, :stepNamesRequest, 15
    optional ::Main::StepNamesResponse, :stepNamesResponse, 16
    optional ::Main::KillProcessRequest, :killProcessRequest, 17
  end

end
