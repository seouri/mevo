module TermsHelper
  def tree_view(nodes, current_node)
    space = "\t" * (current_node.level - 1)
    sibling = sibling(nodes, current_node)
    tree = []
    tree.push(space + "<ul>") if current_node == sibling.first
    title = current_node.tree_number + ' | ' + current_node.normalized_tree_number + ' | ' + current_node.dui
    link =  link_to(current_node.term.term, term_path(current_node.term, :anchor => current_node.book.title), :title => title)
    tree.push(space + "\t" + "<li class=\"expanded\">" + link)
    children(nodes, current_node).each do |child|
      child_tree = tree_view(nodes, child)
      tree.push(child_tree)
    end
    tree.push(space + "\t" + "</li>")
    tree.push(space + "</ul>") if current_node == sibling.last
    tree.join("\n")
  end

  def sibling(nodes, current_node)
    tree = current_node.normalized_tree_number.split(/\./)
    tree.pop
    parent_tree_num = tree.join(".")
    nodes.select {|n| n.level == current_node.level && n.normalized_tree_number.include?(parent_tree_num)}
  end

  def children(nodes, current_node)
    nodes.select {|n| n.level == current_node.level + 1 && n.tree_number.include?(current_node.tree_number)}
  end
end
