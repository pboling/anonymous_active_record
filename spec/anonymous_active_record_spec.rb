# frozen_string_literal: true

RSpec.describe AnonymousActiveRecord do
  before {
    stub_const("Farm::Animal", Module.new)
    stub_const("Zoo::Animal", Module.new)
  }

  describe "::generate" do
    context "with minimal params" do
      subject(:generate) { described_class.generate }

      it "does not error" do
        block_is_expected.not_to raise_error
      end

      context "with instance" do
        subject(:instance) { generate.new }

        it "can be instantiated" do
          expect(subject).to be_a(ActiveRecord::Base)
        end

        context "timestamps" do
          it "has" do
            expect(subject.created_at).to be_nil
            expect(subject.updated_at).to be_nil
          end
        end

        context "saving" do
          subject(:persisted) do
            instance.save
            instance
          end

          it "does not error" do
            block_is_expected.not_to raise_error
          end

          it "does not have name" do
            expect(persisted).not_to respond_to(:name)
          end

          it "sets timestamps" do
            expect(persisted.created_at).not_to be_nil
            expect(persisted.updated_at).not_to be_nil
          end
        end
      end
    end

    context "with all params" do
      subject(:generate) do
        described_class.generate(
          table_name: table_name,
          klass_namespaces: klass_namespaces,
          klass_basename: klass_basename,
          columns: columns,
          indexes: indexes,
          timestamps: timestamps,
          connection_params: connection_params,
        )
      end

      let(:table_name) { "dogs" }
      let(:klass_namespaces) { %w[Farm Animal] }
      let(:klass_basename) { "my" }
      let(:columns) { ["name"] }
      let(:indexes) { [{columns: ["name"]}] }
      let(:timestamps) { true }
      let(:connection_params) { AnonymousActiveRecord::DEFAULT_CONNECTION_PARAMS }

      it "does not error" do
        block_is_expected.not_to raise_error
      end

      context "instance" do
        subject(:instance) { generate.new }

        it "can be instantiated" do
          expect(instance).to be_a(ActiveRecord::Base)
        end

        context "name" do
          it "has" do
            expect(instance.name).to be_nil
          end
        end

        context "timestamps" do
          it "has" do
            expect(instance.created_at).to be_nil
            expect(instance.updated_at).to be_nil
          end
        end

        context "saving" do
          subject(:persisted) do
            instance.name = "Bobo"
            instance.save
            instance
          end

          it "does not error" do
            block_is_expected.not_to raise_error
          end

          it "sets name" do
            expect(persisted.name).to eq("Bobo")
          end

          it "sets timestamps" do
            expect(persisted.created_at).not_to be_nil
            expect(persisted.updated_at).not_to be_nil
          end
        end
      end
    end

    context "with alternate shape for columns" do
      subject(:generate) do
        described_class.generate(
          table_name: table_name,
          klass_namespaces: klass_namespaces,
          klass_basename: klass_basename,
          columns: columns,
          indexes: indexes,
          timestamps: timestamps,
          connection_params: connection_params,
        )
      end

      let(:table_name) { "dogs" }
      let(:klass_namespaces) { %w[Farm Animal] }
      let(:klass_basename) { "my" }
      let(:columns) { [["name", :string, {limit: 10}], ["baked_at", :time], ["smurf"]] }
      let(:indexes) { [[:name, {name: "name_index"}], [[:baked_at, :name]], [[:baked_at, :smurf], {name: "baked_smurf_index"}]] }
      let(:timestamps) { true }
      let(:connection_params) { AnonymousActiveRecord::DEFAULT_CONNECTION_PARAMS }

      it "does not error" do
        block_is_expected.not_to raise_error
      end

      context "instance" do
        subject(:instance) { generate.new }

        it "can be instantiated" do
          expect(instance).to be_a(ActiveRecord::Base)
        end

        context "name" do
          it "has" do
            expect(instance.name).to be_nil
          end
        end

        context "baked_at" do
          it "has" do
            expect(instance.baked_at).to be_nil
          end
        end

        context "timestamps" do
          it "has" do
            expect(instance.created_at).to be_nil
            expect(instance.updated_at).to be_nil
          end
        end

        context "saving" do
          subject(:persisted) do
            instance.name = "Bobo"
            instance.baked_at = Time.now
            instance.save
            instance
          end

          it "does not error" do
            block_is_expected.not_to raise_error
          end

          it "sets name" do
            expect(persisted.name).to eq("Bobo")
          end

          it "sets baked_at" do
            expect([ActiveRecord::Type::Time::Value, Time]).to include(persisted.baked_at.class)
          end

          it "sets timestamps" do
            expect(persisted.created_at).not_to be_nil
            expect(persisted.updated_at).not_to be_nil
          end
        end
      end
    end

    context "when designating type" do
      subject(:generate) do
        described_class.generate(
          table_name: table_name,
          klass_namespaces: klass_namespaces,
          klass_basename: klass_basename,
          columns: columns,
          indexes: indexes,
          timestamps: timestamps,
          connection_params: connection_params,
        )
      end

      let(:table_name) { "dogs" }
      let(:klass_namespaces) { %w[Farm Animal] }
      let(:klass_basename) { "my" }
      let(:columns) { [{name: "name", type: "string"}, {name: "baked_at", type: "time"}] }
      let(:indexes) { [] }
      let(:timestamps) { true }
      let(:connection_params) { AnonymousActiveRecord::DEFAULT_CONNECTION_PARAMS }

      it "does not error" do
        block_is_expected.not_to raise_error
      end

      context "instance" do
        subject(:instance) { generate.new }

        it "can be instantiated" do
          expect(instance).to be_a(ActiveRecord::Base)
        end

        context "name" do
          it "has" do
            expect(instance.name).to be_nil
          end
        end

        context "baked_at" do
          it "has" do
            expect(instance.baked_at).to be_nil
          end
        end

        context "timestamps" do
          it "has" do
            expect(instance.created_at).to be_nil
            expect(instance.updated_at).to be_nil
          end
        end

        context "saving" do
          subject(:persisted) do
            instance.name = "Bobo"
            instance.baked_at = Time.now
            instance.save
            instance
          end

          it "does not error" do
            block_is_expected.not_to raise_error
          end

          it "sets name" do
            expect(persisted.name).to eq("Bobo")
          end

          it "sets baked_at" do
            expect([ActiveRecord::Type::Time::Value, Time]).to include(persisted.baked_at.class)
          end

          it "sets timestamps" do
            expect(persisted.created_at).not_to be_nil
            expect(persisted.updated_at).not_to be_nil
          end
        end
      end
    end

    context "when designating default" do
      subject(:generate) do
        described_class.generate(
          table_name: table_name,
          klass_namespaces: klass_namespaces,
          klass_basename: klass_basename,
          columns: columns,
          indexes: indexes,
          timestamps: timestamps,
          connection_params: connection_params,
        )
      end

      let(:table_name) { "dogs" }
      let(:klass_namespaces) { %w[Farm Animal] }
      let(:klass_basename) { "my" }
      let(:columns) do
        [{name: "name", type: "string", default: "Bird Man"}, {name: "number", type: "integer", default: 0}]
      end
      let(:indexes) { [] }
      let(:timestamps) { true }
      let(:connection_params) { AnonymousActiveRecord::DEFAULT_CONNECTION_PARAMS }

      it "does not error" do
        block_is_expected.not_to raise_error
      end

      context "instance" do
        subject(:instance) { generate.new }

        it "can be instantiated" do
          expect(instance).to be_a(ActiveRecord::Base)
        end

        context "name" do
          it "has" do
            expect(instance.name).to eq("Bird Man")
          end
        end

        context "number" do
          it "has" do
            expect(instance.number).to eq(0)
          end
        end

        context "timestamps" do
          it "has" do
            expect(instance.created_at).to be_nil
            expect(instance.updated_at).to be_nil
          end
        end

        context "saving" do
          subject(:persisted) do
            instance.name = "Bobo"
            instance.number += 111
            instance.save
            instance
          end

          it "does not error" do
            block_is_expected.not_to raise_error
          end

          it "sets name" do
            expect(persisted.name).to eq("Bobo")
          end

          it "sets number" do
            expect(persisted.number).to eq(111)
          end

          it "sets timestamps" do
            expect(persisted.created_at).not_to be_nil
            expect(persisted.updated_at).not_to be_nil
          end
        end
      end
    end

    context "with unique index as options" do
      subject(:generate) do
        described_class.generate(
          table_name: table_name,
          klass_namespaces: klass_namespaces,
          klass_basename: klass_basename,
          columns: columns,
          indexes: indexes,
          timestamps: timestamps,
          connection_params: connection_params,
        )
      end

      let(:table_name) { "dogs" }
      let(:klass_namespaces) { %w[Farm Animal] }
      let(:klass_basename) { "my" }
      let(:columns) { [{name: "name", type: "string"}, {name: "baked_at", type: "time"}] }
      let(:indexes) { [{columns: ["name"], unique: true}, {columns: ["baked_at"]}] }
      let(:timestamps) { true }
      let(:connection_params) { AnonymousActiveRecord::DEFAULT_CONNECTION_PARAMS }

      it "does not error" do
        block_is_expected.not_to raise_error
      end

      context "instance" do
        subject(:instance) { generate.new }

        it "can be instantiated" do
          expect(subject).to be_a(ActiveRecord::Base)
        end

        context "name" do
          it "has" do
            expect(subject.name).to be_nil
          end
        end

        context "baked_at" do
          it "has" do
            expect(subject.baked_at).to be_nil
          end
        end

        context "timestamps" do
          it "has" do
            expect(subject.created_at).to be_nil
            expect(subject.updated_at).to be_nil
          end
        end

        context "saving" do
          subject(:persisted) do
            instance.name = "Bobo"
            instance.baked_at = Time.now
            instance.save
            instance
          end

          it "does not error" do
            block_is_expected.not_to raise_error
          end

          it "sets name" do
            expect(persisted.name).to eq("Bobo")
          end

          it "sets baked_at" do
            expect([ActiveRecord::Type::Time::Value, Time]).to include(subject.baked_at.class)
          end

          it "sets timestamps" do
            expect(persisted.created_at).not_to be_nil
            expect(persisted.updated_at).not_to be_nil
          end
        end

        context "uniqueness enforced by index" do
          subject(:duplicate) do
            i = model.new
            i.name = "Bobo"
            i.baked_at = Time.now
            i.save!
          end

          let(:model) do
            described_class.generate(
              table_name: table_name,
              klass_namespaces: klass_namespaces,
              klass_basename: klass_basename,
              columns: columns,
              indexes: indexes,
              timestamps: timestamps,
              connection_params: connection_params,
            )
          end

          before do
            i = model.new
            i.name = "Bobo"
            i.baked_at = Time.now
            i.save
          end

          it "raises error" do
            block_is_expected.to raise_error(ActiveRecord::RecordNotUnique)
          end
        end
      end
    end

    context "with unique index as implicit" do
      subject(:generate) do
        described_class.generate(
          table_name: table_name,
          klass_namespaces: klass_namespaces,
          klass_basename: klass_basename,
          columns: columns,
          indexes: indexes,
          timestamps: timestamps,
          connection_params: connection_params,
        )
      end

      let(:table_name) { "dogs" }
      let(:klass_namespaces) { %w[Farm Animal] }
      let(:klass_basename) { "my" }
      let(:columns) { [{name: "name", type: "string"}, {name: "baked_at", type: "time"}] }
      let(:indexes) { [[["name"], {unique: true}], "baked_at"] }
      let(:timestamps) { true }
      let(:connection_params) { AnonymousActiveRecord::DEFAULT_CONNECTION_PARAMS }

      it "does not error" do
        block_is_expected.not_to raise_error
      end

      context "instance" do
        subject(:instance) { generate.new }

        it "can be instantiated" do
          expect(instance).to be_a(ActiveRecord::Base)
        end

        context "name" do
          it "has" do
            expect(instance.name).to be_nil
          end
        end

        context "baked_at" do
          it "has" do
            expect(instance.baked_at).to be_nil
          end
        end

        context "timestamps" do
          it "has" do
            expect(instance.created_at).to be_nil
            expect(instance.updated_at).to be_nil
          end
        end

        context "saving" do
          subject(:persisted) do
            instance.name = "Bobo"
            instance.baked_at = Time.now
            instance.save
            instance
          end

          it "does not error" do
            block_is_expected.not_to raise_error
          end

          it "sets name" do
            expect(persisted.name).to eq("Bobo")
          end

          it "sets baked_at" do
            expect([ActiveRecord::Type::Time::Value, Time]).to include(persisted.baked_at.class)
          end

          it "sets timestamps" do
            expect(persisted.created_at).not_to be_nil
            expect(persisted.updated_at).not_to be_nil
          end
        end

        context "uniqueness enforced by index" do
          subject(:duplicate) do
            i = model.new
            i.name = "Bobo"
            i.baked_at = Time.now
            i.save!
          end

          let(:model) do
            described_class.generate(
              table_name: table_name,
              klass_namespaces: klass_namespaces,
              klass_basename: klass_basename,
              columns: columns,
              indexes: indexes,
              timestamps: timestamps,
              connection_params: connection_params,
            )
          end

          before do
            i = model.new
            i.name = "Bobo"
            i.baked_at = Time.now
            i.save
          end

          it "raises error" do
            block_is_expected.to raise_error(ActiveRecord::RecordNotUnique)
          end
        end
      end
    end

    context "with no timestamps" do
      subject(:generate) do
        described_class.generate(
          table_name: table_name,
          klass_basename: klass_basename,
          columns: columns,
          timestamps: timestamps,
          connection_params: connection_params,
        )
      end

      let(:table_name) { "dogs" }
      let(:klass_basename) { "my" }
      let(:columns) { ["name"] }
      let(:timestamps) { false }
      let(:connection_params) { AnonymousActiveRecord::DEFAULT_CONNECTION_PARAMS }

      it "does not error" do
        block_is_expected.not_to raise_error
      end

      context "instance" do
        subject(:instance) { generate.new }

        it "can be instantiated" do
          expect(instance).to be_a(ActiveRecord::Base)
        end

        context "timestamps" do
          it "has not" do
            expect(instance).not_to respond_to(:created_at)
            expect(instance).not_to respond_to(:updated_at)
          end
        end

        context "saving" do
          subject(:persisted) do
            instance.name = "Bobo"
            instance.save
            instance
          end

          it "does not error" do
            block_is_expected.not_to raise_error
          end

          it "sets name" do
            expect(persisted.name).to eq("Bobo")
          end

          it "has no timestamps" do
            expect(persisted).not_to respond_to(:created_at)
            expect(persisted).not_to respond_to(:updated_at)
          end
        end
      end
    end

    context "with block" do
      subject(:generate) do
        described_class.generate(
          table_name: table_name,
          klass_basename: klass_basename,
          columns: columns,
          timestamps: timestamps,
          connection_params: connection_params,
        ) do
          def eat_pie
            "eating"
          end

          def flowery_name
            "🌸#{name}🌸"
          end
        end
      end

      let(:table_name) { "dogs" }
      let(:klass_basename) { "my" }
      let(:columns) { ["name"] }
      let(:timestamps) { false }
      let(:connection_params) { AnonymousActiveRecord::DEFAULT_CONNECTION_PARAMS }

      it "does not error" do
        block_is_expected.not_to raise_error
      end

      context "instance" do
        subject(:instance) { generate.new(name: "Marty McFly") }

        it "can be instantiated" do
          expect(instance).to be_a(ActiveRecord::Base)
        end

        context "block" do
          it "defines method" do
            expect(instance.eat_pie).to eq("eating")
          end

          it "has access to class context" do
            expect(instance.flowery_name).to eq("🌸Marty McFly🌸")
          end
        end

        context "timestamps" do
          it "has not" do
            expect(instance).not_to respond_to(:created_at)
            expect(instance).not_to respond_to(:updated_at)
          end
        end

        context "saving" do
          subject(:persisted) do
            instance.name = "Bobo"
            instance.save
            instance
          end

          it "does not error" do
            block_is_expected.not_to raise_error
          end

          it "sets name" do
            expect(persisted.name).to eq("Bobo")
          end

          it "has access to class context" do
            expect(persisted.flowery_name).to eq("🌸Bobo🌸")
          end

          it "has no timestamps" do
            expect(persisted).not_to respond_to(:created_at)
            expect(persisted).not_to respond_to(:updated_at)
          end
        end
      end
    end

    context "when testing a module" do
      let!(:has_balloon) do
        module HasBalloon
          def has_balloon?
            name == "Spot" # only Spot has a balloon
          end
        end
      end
      let(:ar_with_balloon) do
        described_class.generate(columns: ["name"]) do
          include HasBalloon
          def flowery_name
            "#{b_f}#{name}#{b_f}"
          end

          def b_f
            has_balloon? ? "🎈" : "🌸"
          end
        end
      end

      it "can test the module" do
        expect(ar_with_balloon.new(name: "Spot").flowery_name).to eq("🎈Spot🎈")
        expect(ar_with_balloon.new(name: "Not Spot").flowery_name).to eq("🌸Not Spot🌸")
      end
    end
  end

  describe "::factory" do
    context "with minimal params" do
      subject(:anon_factory) { described_class.factory }

      it "be an array" do
        expect(anon_factory).to be_a(Array)
      end

      it "has length 0" do
        expect(anon_factory.length).to eq(0)
      end
    end

    context "with all params" do
      subject(:anon_factory) do
        described_class.factory(
          source_data: source_data,
          table_name: table_name,
          klass_namespaces: klass_namespaces,
          klass_basename: klass_basename,
          columns: columns,
          indexes: indexes,
          timestamps: timestamps,
          connection_params: connection_params,
        )
      end

      let(:table_name) { "dogs" }
      let(:klass_namespaces) { %w[Zoo Animal] }
      let(:klass_basename) { "my" }
      let(:columns) { ["name"] }
      let(:indexes) { [{columns: ["name"]}] }
      let(:timestamps) { true }
      let(:source_data) { [{name: "Gru Banksy"}, {name: "Herlina Termalina"}] }
      let(:connection_params) { AnonymousActiveRecord::DEFAULT_CONNECTION_PARAMS }

      it "be an array" do
        expect(anon_factory).to be_a(Array)
      end

      it "has length 2" do
        expect(anon_factory.length).to eq(2)
      end

      it "sets attributes" do
        expect(anon_factory.map(&:name)).to eq(["Gru Banksy", "Herlina Termalina"])
      end
    end

    context "no timestamps" do
      subject(:anon_factory) do
        described_class.factory(
          source_data: source_data,
          table_name: table_name,
          klass_basename: klass_basename,
          columns: columns,
          indexes: indexes,
          timestamps: timestamps,
          connection_params: connection_params,
        )
      end

      let(:table_name) { "dogs" }
      let(:klass_basename) { "my" }
      let(:columns) { ["name"] }
      let(:indexes) { [{columns: ["name"]}] }
      let(:timestamps) { false }
      let(:source_data) { [{name: "Gru Banksy"}, {name: "Herlina Termalina"}] }
      let(:connection_params) { AnonymousActiveRecord::DEFAULT_CONNECTION_PARAMS }

      it "be an array" do
        expect(anon_factory).to be_a(Array)
      end

      it "has length 2" do
        expect(anon_factory.length).to eq(2)
      end

      it "does not have timestamps" do
        expect(anon_factory.map { |anon| anon.respond_to?(:created_at) }).to eq([false, false])
      end
    end

    context "with block" do
      subject(:anon_factory) do
        described_class.factory(
          source_data: source_data,
          table_name: table_name,
          klass_basename: klass_basename,
          columns: columns,
          indexes: indexes,
          timestamps: timestamps,
          connection_params: connection_params,
        ) do
          def eat_pie
            "eating"
          end

          def flowery_name
            "🌸#{name}🌸"
          end
        end
      end

      let(:table_name) { "dogs" }
      let(:klass_basename) { "my" }
      let(:columns) { ["name"] }
      let(:indexes) { [{columns: ["name"]}] }
      let(:timestamps) { false }
      let(:source_data) { [{name: "Gru Banksy"}, {name: "Herlina Termalina"}] }
      let(:connection_params) { AnonymousActiveRecord::DEFAULT_CONNECTION_PARAMS }

      it "be an array" do
        expect(anon_factory).to be_a(Array)
      end

      it "has length 2" do
        expect(anon_factory.length).to eq(2)
      end

      it "defines method" do
        expect(anon_factory.map(&:eat_pie)).to eq(%w[eating eating])
      end

      it "sets attributes" do
        expect(anon_factory.map(&:flowery_name)).to eq(["🌸Gru Banksy🌸", "🌸Herlina Termalina🌸"])
      end
    end
  end

  describe "::factory!" do
    context "minimal params" do
      context "returns array" do
        subject(:anon_factory) { described_class.factory! }

        it "be an array" do
          expect(anon_factory).to be_a(Array)
        end

        it "has length 0" do
          expect(anon_factory.length).to eq(0)
        end
      end
    end

    context "all params" do
      subject(:anon_factory) do
        described_class.factory!(
          source_data: source_data,
          table_name: table_name,
          klass_namespaces: klass_namespaces,
          klass_basename: klass_basename,
          columns: columns,
          indexes: indexes,
          timestamps: timestamps,
          connection_params: connection_params,
        )
      end

      let(:table_name) { "dogs" }
      let(:klass_namespaces) { %w[Zoo Animal] }
      let(:klass_basename) { "my" }
      let(:columns) { ["name"] }
      let(:indexes) { [{columns: ["name"]}] }
      let(:timestamps) { true }
      let(:source_data) { [{name: "Gru Banksy"}, {name: "Herlina Termalina"}] }
      let(:connection_params) { AnonymousActiveRecord::DEFAULT_CONNECTION_PARAMS }

      context "returns array" do
        it "be an array" do
          expect(anon_factory).to be_a(Array)
        end

        it "has length 2" do
          expect(anon_factory.length).to eq(2)
        end
      end

      context "sets attributes" do
        subject(:attributes) { anon_factory.map(&:name) }

        it "be an array" do
          expect(attributes).to eq(["Gru Banksy", "Herlina Termalina"])
        end
      end
    end

    context "no timestamps" do
      subject(:anon_factory) do
        described_class.factory!(
          source_data: source_data,
          table_name: table_name,
          klass_basename: klass_basename,
          columns: columns,
          indexes: indexes,
          timestamps: timestamps,
          connection_params: connection_params,
        )
      end

      let(:table_name) { "dogs" }
      let(:klass_basename) { "my" }
      let(:columns) { ["name"] }
      let(:indexes) { [{columns: ["name"]}] }
      let(:timestamps) { false }
      let(:source_data) { [{name: "Gru Banksy"}, {name: "Herlina Termalina"}] }
      let(:connection_params) { AnonymousActiveRecord::DEFAULT_CONNECTION_PARAMS }

      context "returns array" do
        it "be an array" do
          expect(anon_factory).to be_a(Array)
        end

        it "has length 2" do
          expect(anon_factory.length).to eq(2)
        end
      end

      context "does not have timestamps" do
        it "be an array" do
          expect(anon_factory.map { |anon| anon.respond_to?(:created_at) }).to eq([false, false])
        end
      end
    end

    context "with block" do
      subject(:anon_factory) do
        described_class.factory!(
          source_data: source_data,
          table_name: table_name,
          klass_basename: klass_basename,
          columns: columns,
          indexes: indexes,
          timestamps: timestamps,
          connection_params: connection_params,
        ) do
          def eat_pie
            "eating"
          end

          def flowery_name
            "🌸#{name}🌸"
          end
        end
      end

      let(:table_name) { "dogs" }
      let(:klass_basename) { "my" }
      let(:columns) { ["name"] }
      let(:indexes) { [{columns: ["name"]}] }
      let(:timestamps) { false }
      let(:source_data) { [{name: "Gru Banksy"}, {name: "Herlina Termalina"}] }
      let(:connection_params) { AnonymousActiveRecord::DEFAULT_CONNECTION_PARAMS }

      context "returns array" do
        it "be an array" do
          expect(anon_factory).to be_a(Array)
        end

        it "has length 2" do
          expect(anon_factory.length).to eq(2)
        end
      end

      context "defines method" do
        subject(:pie_eating) { anon_factory.map(&:eat_pie) }

        it "defines method" do
          expect(pie_eating).to eq(%w[eating eating])
        end
      end

      context "sets attributes" do
        subject(:flowery_name) { anon_factory.map(&:flowery_name) }

        it "be an array" do
          expect(flowery_name).to eq(["🌸Gru Banksy🌸", "🌸Herlina Termalina🌸"])
        end
      end
    end
  end
end
