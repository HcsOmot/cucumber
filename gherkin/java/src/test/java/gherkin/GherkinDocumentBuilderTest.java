package gherkin;

import cucumber.messages.Gherkin;
import cucumber.messages.Gherkin.FeatureChild;
import cucumber.messages.Gherkin.GherkinDocument;
import cucumber.messages.Pickles;
import cucumber.messages.Pickles.Pickle;
import gherkin.pickles.Compiler;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.assertEquals;

public class GherkinDocumentBuilderTest {
    @Test
    public void is_reusable() {
        Parser<GherkinDocument> parser = new Parser<>(new GherkinDocumentBuilder());
        TokenMatcher matcher = new TokenMatcher();

        GherkinDocument d1 = parser.parse("Feature: 1", matcher);
        GherkinDocument d2 = parser.parse("Feature: 2", matcher);

        assertEquals("1", d1.getFeature().getName());
        assertEquals("2", d2.getFeature().getName());
    }

    @Test
    public void parses_rules() {
        Parser<GherkinDocument> parser = new Parser<>(new GherkinDocumentBuilder());
        GherkinDocument doc = parser.parse("" +
                "Feature: Some rules\n" +
                "\n" +
                "  Background:\n" +
                "    Given fb\n" +
                "\n" +
                "  Rule: A\n" +
                "    The rule A description\n" +
                "\n" +
                "    Background:\n" +
                "      Given ab\n" +
                "\n" +
                "    Example: Example A\n" +
                "      Given a\n" +
                "\n" +
                "  Rule: B\n" +
                "    The rule B description\n" +
                "\n" +
                "    Example: Example B\n" +
                "      Given b");

        List<FeatureChild> children = doc.getFeature().getChildrenList();
        assertEquals(3, children.size());

        Compiler compiler = new Compiler();
        List<Pickle> pickles = compiler.compile(doc, "hello.feature");
        assertEquals(2, pickles.size());

        assertEquals(3, pickles.get(0).getStepsList().size());

        assertEquals(2, pickles.get(1).getStepsList().size());
    }

    @Test
    public void parses_just_comments() {
        Parser<GherkinDocument> parser = new Parser<>(new GherkinDocumentBuilder());
        GherkinDocument doc = parser.parse("" +
                "# Just a comment");
        List<Gherkin.Comment> children = doc.getCommentsList();
        assertEquals(1, children.size());
    }

    @Test
    public void sets_empty_table_cells() {
        Parser<GherkinDocument> parser = new Parser<>(new GherkinDocumentBuilder());
        GherkinDocument doc = parser.parse("" +
                "Feature:\n  Scenario:\n    Given a table\n      |a||b|");
        Gherkin.TableRow row = doc.getFeature().getChildren(0).getScenario().getSteps(0).getDataTable().getRows(0);
        assertEquals("a", row.getCells(0).getValue());
        assertEquals("", row.getCells(1).getValue());
        assertEquals("b", row.getCells(2).getValue());
    }

    @Test
    public void reports_step_text_column() {
        Parser<GherkinDocument> parser = new Parser<>(new GherkinDocumentBuilder());
        GherkinDocument doc = parser.parse("" +
                "Feature:\n  Scenario:\n    Given a step");
        Compiler compiler = new Compiler();
        List<Pickle> pickles = compiler.compile(doc, "hello.feature");

        Pickles.PickleStep step = pickles.get(0).getSteps(0);
        assertEquals(11, step.getLocations(0).getColumn());

    }

}
