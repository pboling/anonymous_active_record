RSpec.describe AnonymousActiveRecord do
  it 'has a version number' do
    expect(AnonymousActiveRecord::VERSION).not_to be nil
  end

  describe '.generate' do
    context 'minimal params' do
      context 'defines' do
        subject { described_class.generate() }
        it 'defines a class' do
          is_expected.to be_a(Class)
        end
      end
      context 'instance' do
        subject { described_class.generate().new }
        it 'can be instantiated' do
          is_expected.to be_a(ActiveRecord::Base)
        end
        context 'timestamps' do
          it 'has' do
            expect(subject.created_at).to be_nil
            expect(subject.updated_at).to be_nil
          end
        end
        context 'saving' do
          subject do
            i = super()
            i.save
            i
          end
          it 'does not error' do
            expect { subject }.to_not raise_error
          end
          it 'sets timestamps' do
            expect(subject.created_at).to_not be_nil
            expect(subject.updated_at).to_not be_nil
          end
        end
      end
    end
    context 'all params' do
      let!(:farm_animal) {
        module Farm
          module Animal
          end
        end
      }
      let(:table_name) { 'dogs' }
      let(:klass_namespaces) { %w[Farm Animal] }
      let(:klass_basename) { 'my' }
      let(:columns) { ['name'] }
      let(:timestamps) { true }
      let(:connection_params) { AnonymousActiveRecord::DEFAULT_CONNECTION_PARAMS }
      subject { described_class.generate(
          table_name: table_name,
          klass_namespaces: klass_namespaces,
          klass_basename: klass_basename,
          columns: columns,
          timestamps: timestamps,
          connection_params: connection_params)
      }
      context 'defines' do
        it 'defines a class' do
          is_expected.to be_a(Class)
        end
      end
      context 'instance' do
        subject { super().new }
        it 'can be instantiated' do
          is_expected.to be_a(ActiveRecord::Base)
        end
        context 'timestamps' do
          it 'has' do
            expect(subject.created_at).to be_nil
            expect(subject.updated_at).to be_nil
          end
        end
        context 'saving' do
          subject do
            i = super()
            i.save
            i
          end
          it 'does not error' do
            expect { subject }.to_not raise_error
          end
          it 'sets timestamps' do
            expect(subject.created_at).to_not be_nil
            expect(subject.updated_at).to_not be_nil
          end
        end
      end
    end
  end

  describe '.factory' do
    context 'minimal params' do
      context 'defines' do
        subject { described_class.factory() }
        it 'defines a class' do
          is_expected.to be_a(Class)
        end
      end
      context 'instance' do
        subject { described_class.factory().new }
        it 'can be instantiated' do
          is_expected.to be_a(ActiveRecord::Base)
        end
        context 'timestamps' do
          it 'has' do
            expect(subject.created_at).to be_nil
            expect(subject.updated_at).to be_nil
          end
        end
        context 'saving' do
          subject do
            i = super()
            i.name = 'bobo'
            i.save
            i
          end
          it 'does not error' do
            expect { subject }.to_not raise_error
          end
          it 'sets name' do
            expect(subject.name).to eq('bobo')
          end
          it 'sets timestamps' do
            expect(subject.created_at).to_not be_nil
            expect(subject.updated_at).to_not be_nil
          end
        end
      end
    end
    context 'all params' do
      let!(:farm_animal) {
        module Farm
          module Animal
          end
        end
      }
      let(:table_name) { 'dogs' }
      let(:klass_namespaces) { %w[Farm Animal] }
      let(:klass_basename) { 'my' }
      let(:columns) { ['name'] }
      let(:timestamps) { true }
      let(:connection_params) { AnonymousActiveRecord::DEFAULT_CONNECTION_PARAMS }
      subject { described_class.generate(
          table_name: table_name,
          klass_namespaces: klass_namespaces,
          klass_basename: klass_basename,
          columns: columns,
          timestamps: timestamps,
          connection_params: connection_params)
      }
      context 'defines' do
        it 'defines a class' do
          is_expected.to be_a(Class)
        end
      end
      context 'instance' do
        subject { super().new }
        it 'can be instantiated' do
          is_expected.to be_a(ActiveRecord::Base)
        end
        context 'timestamps' do
          it 'has' do
            expect(subject.created_at).to be_nil
            expect(subject.updated_at).to be_nil
          end
        end
        context 'saving' do
          subject do
            i = super()
            i.name = 'bobo'
            i.save
            i
          end
          it 'does not error' do
            expect { subject }.to_not raise_error
          end
          it 'sets name' do
            expect(subject.name).to eq('bobo')
          end
          it 'sets timestamps' do
            expect(subject.created_at).to_not be_nil
            expect(subject.updated_at).to_not be_nil
          end
        end
      end
    end
    context 'no timestamps' do
      let!(:farm_animal) {
        module Farm
          module Animal
          end
        end
      }
      let(:table_name) { 'dogs' }
      let(:klass_basename) { 'my' }
      let(:columns) { ['name'] }
      let(:timestamps) { false }
      let(:connection_params) { AnonymousActiveRecord::DEFAULT_CONNECTION_PARAMS }
      subject { described_class.generate(
          table_name: table_name,
          klass_basename: klass_basename,
          columns: columns,
          timestamps: timestamps,
          connection_params: connection_params)
      }
      context 'defines' do
        it 'defines a class' do
          is_expected.to be_a(Class)
        end
      end
      context 'instance' do
        subject { super().new }
        it 'can be instantiated' do
          is_expected.to be_a(ActiveRecord::Base)
        end
        context 'timestamps' do
          it 'has not' do
            expect(subject).to_not respond_to(:created_at)
            expect(subject).to_not respond_to(:updated_at)
          end
        end
        context 'saving' do
          subject do
            i = super()
            i.save
            i
          end
          it 'does not error' do
            expect { subject }.to_not raise_error
          end
          it 'sets timestamps' do
            expect(subject.created_at).to_not be_nil
            expect(subject.updated_at).to_not be_nil
          end
        end
      end
    end
  end
end
