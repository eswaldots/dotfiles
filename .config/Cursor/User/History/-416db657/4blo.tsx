import { createFileRoute } from "@tanstack/react-router";
import SearchInput from "@/components/inputs/search-input";
import ItemsTable from "../bounding/-components/items-table";
import ItemTable from "../bounding/-components/item-table";
import { getBoundings } from "@/services/analysis.service";

export const Route = createFileRoute(
  "/_app/analysis/_layout/management/update/"
)({
  component: RouteComponent,
  // @ts-expect-error ts-migrate(2339) FIXME: Property 'q' does not exist on type {}.
  loaderDeps: ({ search: { q } }) => ({ q }),
  loader: async ({ deps: { q } }) => {
    const res = await getBoundings(q);

    if (res.error) {
      throw new Error(res.error.toString());
    }

    return res
  }
});

function RouteComponent() {
  const navigate = Route.useNavigate();
  const boundings = Route.useLoaderData().data;

  return (
    <section className="text-left w-screen px-8 flex flex-col gap-4">
      <h1 className="text-2xl text-left font-semibold">Seleccionar banda</h1>

      <div className="w-full">
        <SearchInput label="Buscar banda" />
      </div>

      <ItemsTable>
        {boundings?.map((band: any, index: number) => (
          <ItemTable
            key={band.id}
            isFirst={index === 0}
            isLast={index === boundings.length - 1}
          >
            <div className="flex flex-col">
              <span className="font-semibold">{JSON.stringify(band)}</span>
            </div>
          </ItemTable>
        ))}
      </ItemsTable>
    </section>
  );
}
