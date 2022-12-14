package no.shoppifly;

import io.micrometer.core.annotation.Timed;
import io.micrometer.core.instrument.Gauge;
import io.micrometer.core.instrument.MeterRegistry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController()
public class ShoppingCartController implements ApplicationListener<ApplicationReadyEvent> {

    private final CartService cartService;
    private final MeterRegistry meterRegistry;
    private final NaiveCartImpl naiveCart;

    public int numberOfCheckouts = 1;

    @Autowired
    public ShoppingCartController(CartService cartService, MeterRegistry meterRegistry, NaiveCartImpl naiveCart) {
        this.cartService = cartService;
        this.meterRegistry = meterRegistry;
        this.naiveCart = naiveCart;
    }


    @GetMapping(path = "/cart/{id}")
    public Cart getCart(@PathVariable String id) {
        return cartService.getCart(id);
    }

    /**
     * Checks out a shopping cart. Removes the cart, and returns an order ID
     *
     * @return an order ID
     */
    // /status for testing purposes
    @GetMapping(path = "/status")
    public ResponseEntity<String> status() {
        return ResponseEntity.ok("Server is up and running");
    }

    @Timed(value = "checkouts_latency")
    @PostMapping(path = "/cart/checkout")
    public String checkout(@RequestBody Cart cart) {
        //meterRegistry.counter("checkouts").increment();
        //meterRegistry.timer("checkouts_latency_this").count();
        System.out.println("Number of checkouts: ");
        System.out.println(numberOfCheckouts);
        return cartService.checkout(cart);
    }

    /**
     * Updates a shopping cart, replacing it's contents if it already exists. If no cart exists (id is null)
     * a new cart is created.
     *
     * @return the updated cart
     */
    @PostMapping(path = "/cart")
    public Cart updateCart(@RequestBody Cart cart) {
        meterRegistry.counter("update_cart").increment();
        return cartService.update(cart);
    }

    /**
     * return all cart IDs
     *
     * @return
     */
    @GetMapping(path = "/carts")
    public List<String> getAllCarts() {
        meterRegistry.counter("get_all_carts").increment();
        return cartService.getAllCarts();
    }

    @Override
    public void onApplicationEvent(ApplicationReadyEvent applicationReadyEvent) {
        Gauge.builder("carts", cartService,
                cartService -> cartService.getAllCarts().size()).register(meterRegistry);
        Gauge.builder("cartsvalue", naiveCart, NaiveCartImpl::total).register(meterRegistry);
        Gauge.builder("checkouts", naiveCart, NaiveCartImpl::numberOfCartsCheckedOutFunc).register(meterRegistry);
    }
}