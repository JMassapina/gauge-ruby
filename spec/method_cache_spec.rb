# Copyright 2015 ThoughtWorks, Inc.

# This file is part of Gauge-Ruby.

# Gauge-Ruby is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Gauge-Ruby is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Gauge-Ruby.  If not, see <http://www.gnu.org/licenses/>.

describe Gauge::MethodCache do
  subject { Gauge::MethodCache }
  let(:given_block) { -> { puts "foo" } }
  context 'when before_step <block> is registered' do
    subject { Gauge::MethodCache.get_before_step_hooks[0] }
    before { Gauge::MethodCache.clear_hooks('before_step') }
    describe '.get_before_step_hooks' do
      before{ before_step &given_block }
      it 'should fetch registered <block>' do
        expect(subject[:block]).to eq(given_block)
      end
    end
    context 'with tags' do
      describe '.get_before_step_hooks' do
        before{
          Gauge::MethodCache.clear_hooks('before_step')
          before_step(tags: ['tag1'], &given_block)
        }
        it 'should fetch registered <block>' do
          expect(subject[:block]).to eq given_block
        end
        it 'should fetch options for registered <block>' do
          expect(subject[:options]).to eq({tags: ['tag1'], operator: 'AND'})
        end
      end
    end
  end

  context 'when before_spec <block> is registered' do
    subject { Gauge::MethodCache.get_before_spec_hooks[0] }
    before { Gauge::MethodCache.clear_hooks('before_spec') }
    describe '.get_before_spec_hooks' do
      before { before_spec &given_block }
      it 'should fetch registered <block>' do
        expect(subject[:block]).to eq(given_block)
      end
    end
    context 'with tags' do
      describe '.get_before_spec_hooks' do
        before{ before_spec({tags: %w(tag1 tag2), operator: 'OR'}, &given_block) }
        it 'should fetch registered <block>' do
          expect(subject[:block]).to eq given_block
        end
        it 'should fetch options for registered <block>' do
          expect(subject[:options]).to eq({tags: %w(tag1 tag2), operator: 'OR'})
        end
      end
    end
  end

  context 'when before_scenario <block> is registered' do
    subject { Gauge::MethodCache.get_before_scenario_hooks[0] }
    before { Gauge::MethodCache.clear_hooks('before_scenario') }
    describe '.get_before_scenario_hooks' do
      before { before_scenario &given_block }
      it 'should fetch registered <block>' do
        expect(subject[:block]).to eq(given_block)
      end
    end
    context 'with tags' do
      describe '.get_before_scenario_hooks' do
        before{ before_scenario({tags: %w(tag1 tag2 tag3), operator: 'OR'}, &given_block) }
        it 'should fetch registered <block>' do
          expect(subject[:block]).to eq given_block
        end
        it 'should fetch options for registered <block>' do
          expect(subject[:options]).to eq({tags: %w(tag1 tag2 tag3), operator: 'OR'})
        end
      end
    end
  end

  context 'when before_suite <block> is registered' do
    subject { Gauge::MethodCache.get_before_suite_hooks[0] }
    describe '.get_before_suite_hooks' do
      before {
        Gauge::MethodCache.clear_hooks('before_suite')
        before_suite &given_block
      }
      it 'should fetch registered <block>' do
        expect(subject[:block]).to eq(given_block)
      end
    end
  end

  context 'when after_step <block> is registered' do
    subject { Gauge::MethodCache.get_after_step_hooks[0] }
    before { Gauge::MethodCache.clear_hooks('after_step') }
    describe '.get_after_step_hooks' do
      before { after_step &given_block }
      it 'should fetch registered <block>' do
        expect(subject[:block]).to eq(given_block)
      end
    end
    context 'with tags' do
      describe '.get_after_step_hooks' do
        before{ after_step({tags: %w(tag1 tag2), operator: 'OR'}, &given_block) }
        it 'should fetch registered <block>' do
          expect(subject[:block]).to eq given_block
        end
        it 'should fetch options for registered <block>' do
          expect(subject[:options]).to eq({tags: %w(tag1 tag2), operator: 'OR'})
        end
      end
    end
  end

  context 'when after_spec <block> is registered' do
    subject { Gauge::MethodCache.get_after_spec_hooks[0] }
    before { Gauge::MethodCache.clear_hooks('after_spec') }
    describe '.get_after_spec_hooks' do
      before { after_spec &given_block }
      it 'should fetch registered <block>' do
        expect(subject[:block]).to eq(given_block)
      end
    end
    context 'with tags' do
      describe '.get_after_spec_hooks' do
        before{ after_spec({tags: %w(tag1), operator: 'OR'}, &given_block) }
        it 'should fetch registered <block>' do
          expect(subject[:block]).to eq given_block
        end
        it 'should fetch options for registered <block>' do
          expect(subject[:options]).to eq({tags: %w(tag1), operator: 'OR'})
        end
      end
    end
  end

  context 'when after_scenario <block> is registered' do
    subject { Gauge::MethodCache.get_after_scenario_hooks[0] }
    before { Gauge::MethodCache.clear_hooks('after_scenario') }
    describe '.get_after_scenario_hooks' do
      before { after_scenario &given_block }
      it 'should fetch registered <block>' do
        expect(subject[:block]).to eq(given_block)
      end
    end
    context 'with tags' do
      describe '.get_after_scenario_hooks' do
        before{ after_scenario({tags: %w(tag1 tag5), operator: 'AND'}, &given_block) }
        it 'should fetch registered <block>' do
          expect(subject[:block]).to eq given_block
        end
        it 'should fetch options for registered <block>' do
          expect(subject[:options]).to eq({tags: %w(tag1 tag5), operator: 'AND'})
        end
      end
    end
  end

  context 'when after_suite <block> is registered' do
    subject { Gauge::MethodCache.get_after_suite_hooks[0] }
    describe '.get_after_suite_hooks' do
      before {
        Gauge::MethodCache.clear_hooks('after_suite')
        after_suite &given_block
      }
      it 'should fetch registered <block>' do
        expect(subject[:block]).to eq(given_block)
      end
    end
  end

  context 'step definitions' do
    before(:each) {
      %w(step_text bar baz).each { |v|
        allow(Gauge::Connector).to receive(:step_value).with(v).and_return("parameterized_#{v}")
      }
    }
    context "when 'step_text' is defined for a <block>" do
      before { step 'step_text', &given_block }
      describe ".get_step('parameterized_step_text')" do
        it 'should get registered <block>' do
          expect(subject.get_step('parameterized_step_text')).to eq given_block
        end
      end

      describe ".get_step_text('parameterized_step_text')" do
        subject { Gauge::MethodCache.get_step_text('parameterized_step_text') }
        it { is_expected.to eq "step_text" }
      end
    end
    context 'with more than one step text' do
      it 'has alias' do
        step 'bar', 'baz', &given_block
        %w(bar baz).each { |e|
          expect(subject.has_alias? e).to eq true
        }
      end
    end
    context 'with :continue_on_failure => true' do
      it 'should be marked as recoverable' do
        step 'step_text', continue_on_failure: true, &given_block
        expect(subject.is_recoverable? 'parameterized_step_text').to eq true
      end
    end
  end
end
