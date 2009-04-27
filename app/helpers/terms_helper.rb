module TermsHelper
  def ancestors_and_children(term)
    unique_nodes = []
    term.nodes.each do |node|
      unique_nodes.push(node.ancestors)
      unique_nodes.push(node)
      unique_nodes.push(node.children)
    end
    unique_nodes.flatten.uniq
  end
end
