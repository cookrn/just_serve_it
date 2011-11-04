require "test_helper"

describe JustServeIt do
  it "is a module" do
    JustServeIt.must_be_kind_of Module
  end

  describe "accessors" do
    [
      :env,
      :mongoid_config,
      :rack_app,
      :resources
    ].each do | accessor |
      it "knows its #{ accessor }" do
        JustServeIt.class_variables.must_include "@@#{ accessor }".to_sym
      end

      it "can read its #{ accessor }" do
        JustServeIt.must_respond_to accessor
      end

      it "can write its #{ accessor }" do
        JustServeIt.must_respond_to "#{ accessor }=".to_sym
      end
    end
  end

  describe "readers" do
    [
      :gem_root
    ].each do | reader |
      it "knows its #{ reader }" do
        JustServeIt.class_variables.must_include "@@#{ reader }".to_sym
      end

      it "can read its #{ reader }" do
        JustServeIt.must_respond_to reader
      end
    end
  end

  it "has a fancy setup block" do
    JustServeIt.must_respond_to :setup
  end
end

