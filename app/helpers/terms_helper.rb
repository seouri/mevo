module TermsHelper
  def tree_view(nodes, current_node, term)
    tree = []
    unless current_node.nil?
      space = "\t" * (current_node.level - 1)
      sibling = sibling(nodes, current_node) unless current_node.nil?    
      tree.push(space + "<ul>") if current_node == sibling.first
      title = current_node.tree_number + ' | ' + current_node.normalized_tree_number + ' | ' + current_node.dui
      link_text = current_node.term.term == term.term ? "<strong>#{term.term}</strong>" : current_node.term.term
      link =  link_to(link_text, term_path(current_node.term, :anchor => current_node.book.title), :title => title)
      tree.push(space + "\t" + "<li class=\"expanded\">" + link)
    end
    children(nodes, current_node).each do |child|
      child_tree = tree_view(nodes, child, term)
      tree.push(child_tree)
    end
    unless current_node.nil?
      tree.push(space + "\t" + "</li><!-- #{current_node.term.term} -->")
      tree.push(space + "</ul><!-- #{current_node.term.term} -->") if current_node == sibling.last
    end
    tree.join("\n")
  end

  def sibling(nodes, current_node)
    sibling = []
    if current_node.level == 1
      sibling = nodes.select {|n| n.level == 1}
    else
      tree = current_node.normalized_tree_number.split(/\./)
      tree.pop
      parent_tree_num = tree.join(".") + "."
      sibling = nodes.select {|n| n.level == current_node.level && n.normalized_tree_number.include?(parent_tree_num) }
    end
    sibling
  end

  def children(nodes, current_node)
    children = []
    if current_node.nil?
      children = nodes.select {|n| n.level == 1}
    else
      children = nodes.select {|n| n.level == current_node.level + 1 && n.tree_number.include?(current_node.tree_number)}
    end
    children
  end
end
