# frozen_string_literal: true

require "rails_helper"

RSpec.describe "routes for Portfolios", type: :routing do
  describe "actions" do
    before do
      2.times do |index|
        Portfolio.create(title: "Portfolio title test index #{index}",
          subtitle: "Portfolio subtitle test index #{index}",
          body: "Portfolio body index #{index}"
        )
      end
    end

    let(:first_portfolio) { Portfolio.first }
    let(:first_portfolio_id) { first_portfolio.id }

    context "get index" do
      it "routes to index action" do
        expect(get("/portfolios")).to route_to("portfolios#index")
      end
    end

    # customized portfolio show route
    context "get show" do
      it "routes to show action" do
        expect(get("/portfolio/#{first_portfolio_id}")).to route_to(controller: "portfolios", action: "show", id: first_portfolio_id.to_s)
      end
    end

    context "get new" do
      it "routes to new action" do
        expect(get("/portfolios/new")).to route_to("portfolios#new")
      end
    end

    context "get edit" do
      it "routes to edit action" do
        expect(get("/portfolios/#{first_portfolio_id}/edit")).to route_to(controller: "portfolios", action: "edit", id: first_portfolio_id.to_s)
      end
    end

    context "post create" do
      it "routes to create action" do
        expect(post("/portfolios")).to route_to("portfolios#create")
      end
    end

    context "patch update" do
      it "routes to update action" do
        expect(patch("/portfolios/#{first_portfolio_id}")).to route_to(controller: "portfolios", action: "update", id: first_portfolio_id.to_s)
      end
    end

    context "put update" do
      it "routes to update action" do
        expect(put("/portfolios/#{first_portfolio_id}")).to route_to(controller: "portfolios", action: "update", id: first_portfolio_id.to_s)
      end
    end

    context "delete destory" do
      it "routes to destroy action" do
        expect(delete("/portfolios/#{first_portfolio_id}")).to route_to(controller: "portfolios", action: "destroy", id: first_portfolio_id.to_s)
      end
    end
  end

  describe "routable" do
    it "route to /index" do
      expect(get("/portfolios")).to be_routable
    end
  end
end
