# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: gherkin.proto

require 'google/protobuf'

require_relative 'sources_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "io.cucumber.messages.GherkinDocument" do
    optional :uri, :string, 1
    optional :feature, :message, 2, "io.cucumber.messages.Feature"
    repeated :comments, :message, 3, "io.cucumber.messages.Comment"
  end
  add_message "io.cucumber.messages.Feature" do
    optional :location, :message, 1, "io.cucumber.messages.Location"
    repeated :tags, :message, 2, "io.cucumber.messages.Tag"
    optional :language, :string, 3
    optional :keyword, :string, 4
    optional :name, :string, 5
    optional :description, :string, 6
    repeated :children, :message, 7, "io.cucumber.messages.FeatureChild"
  end
  add_message "io.cucumber.messages.FeatureChild" do
    oneof :value do
      optional :rule, :message, 1, "io.cucumber.messages.Rule"
      optional :background, :message, 2, "io.cucumber.messages.Background"
      optional :scenario, :message, 3, "io.cucumber.messages.Scenario"
    end
  end
  add_message "io.cucumber.messages.Rule" do
    optional :location, :message, 1, "io.cucumber.messages.Location"
    optional :keyword, :string, 2
    optional :name, :string, 3
    optional :description, :string, 4
    repeated :children, :message, 5, "io.cucumber.messages.RuleChild"
  end
  add_message "io.cucumber.messages.RuleChild" do
    oneof :value do
      optional :background, :message, 1, "io.cucumber.messages.Background"
      optional :scenario, :message, 2, "io.cucumber.messages.Scenario"
    end
  end
  add_message "io.cucumber.messages.Background" do
    optional :location, :message, 1, "io.cucumber.messages.Location"
    optional :keyword, :string, 2
    optional :name, :string, 3
    optional :description, :string, 4
    repeated :steps, :message, 5, "io.cucumber.messages.Step"
  end
  add_message "io.cucumber.messages.Scenario" do
    optional :location, :message, 1, "io.cucumber.messages.Location"
    repeated :tags, :message, 2, "io.cucumber.messages.Tag"
    optional :keyword, :string, 3
    optional :name, :string, 4
    optional :description, :string, 5
    repeated :steps, :message, 6, "io.cucumber.messages.Step"
    repeated :examples, :message, 7, "io.cucumber.messages.Examples"
  end
  add_message "io.cucumber.messages.Comment" do
    optional :location, :message, 1, "io.cucumber.messages.Location"
    optional :text, :string, 2
  end
  add_message "io.cucumber.messages.DataTable" do
    optional :location, :message, 1, "io.cucumber.messages.Location"
    repeated :rows, :message, 2, "io.cucumber.messages.TableRow"
  end
  add_message "io.cucumber.messages.DocString" do
    optional :location, :message, 1, "io.cucumber.messages.Location"
    optional :content_type, :string, 2
    optional :content, :string, 3
    optional :delimiter, :string, 4
  end
  add_message "io.cucumber.messages.Examples" do
    optional :location, :message, 1, "io.cucumber.messages.Location"
    repeated :tags, :message, 2, "io.cucumber.messages.Tag"
    optional :keyword, :string, 3
    optional :name, :string, 4
    optional :description, :string, 5
    optional :table_header, :message, 6, "io.cucumber.messages.TableRow"
    repeated :table_body, :message, 7, "io.cucumber.messages.TableRow"
  end
  add_message "io.cucumber.messages.Step" do
    optional :location, :message, 1, "io.cucumber.messages.Location"
    optional :keyword, :string, 2
    optional :text, :string, 3
    oneof :argument do
      optional :doc_string, :message, 5, "io.cucumber.messages.DocString"
      optional :data_table, :message, 6, "io.cucumber.messages.DataTable"
    end
  end
  add_message "io.cucumber.messages.TableCell" do
    optional :location, :message, 1, "io.cucumber.messages.Location"
    optional :value, :string, 2
  end
  add_message "io.cucumber.messages.TableRow" do
    optional :location, :message, 1, "io.cucumber.messages.Location"
    repeated :cells, :message, 2, "io.cucumber.messages.TableCell"
  end
  add_message "io.cucumber.messages.Tag" do
    optional :location, :message, 1, "io.cucumber.messages.Location"
    optional :name, :string, 2
  end
end

module Cucumber
  module Messages
    GherkinDocument = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.cucumber.messages.GherkinDocument").msgclass
    Feature = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.cucumber.messages.Feature").msgclass
    FeatureChild = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.cucumber.messages.FeatureChild").msgclass
    Rule = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.cucumber.messages.Rule").msgclass
    RuleChild = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.cucumber.messages.RuleChild").msgclass
    Background = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.cucumber.messages.Background").msgclass
    Scenario = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.cucumber.messages.Scenario").msgclass
    Comment = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.cucumber.messages.Comment").msgclass
    DataTable = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.cucumber.messages.DataTable").msgclass
    DocString = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.cucumber.messages.DocString").msgclass
    Examples = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.cucumber.messages.Examples").msgclass
    Step = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.cucumber.messages.Step").msgclass
    TableCell = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.cucumber.messages.TableCell").msgclass
    TableRow = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.cucumber.messages.TableRow").msgclass
    Tag = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.cucumber.messages.Tag").msgclass
  end
end