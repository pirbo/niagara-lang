type t
(** Variable representation across the compiler *)

val create : unit -> t
(** Generate a fresh variable *)

val uid : t -> int
(** [uid v] returns the unique identifier of the variable [v] *)

val unique_anon_name : string -> string
(** [unique_anon_name s] returns a unique variable name with prefix [s] *)

val compare : t -> t -> int
val equal : t -> t -> bool

module Map : Map.S with type key = t
module Set : Set.S with type elt = t

(** Directed graph whose nodes are variables and edges events conditionning the
    link *)
module Graph : sig
  include
    Graph.Sig.P
      with type V.t = t
       and type E.label = Set.t
       and type E.t = t * Set.t * t

  module Topology : sig
    val scc : t -> int * (vertex -> int)
    val scc_array : t -> vertex list array
    val scc_list : t -> vertex list list
  end

  val reachables : t -> V.t -> Set.t
  (** set of vertexes reachable from given start vertex *)

  module DAG : sig
    val transitive_closure : t -> t
    (** transitive closure keeping as edges all events on the paths between two
        nodes *)

    val topological_depth_ordering : t -> V.t list
  end
end
